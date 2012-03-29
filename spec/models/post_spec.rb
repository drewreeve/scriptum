# encoding: UTF-8

require_relative '../spec_helper'

describe Post do
  
  it "should require a title" do
    post = build(:post)
    [nil,"", " "].each do |invalid_title|
      post.title = invalid_title
      post.should have_error_on(:title).with_message("can't be blank")
    end
  end
  
  it "should require a user" do
    post = build(:post, :user => nil)
    post.should_not be_valid
  end

  it "should generate a slug if one is not provided" do
    post = create(:post, :title => 'My Awesome Post')
    post.slug.should_not be_nil
  end
  
  it "should ensure slugs are properly formatted" do
    post = create(:post, :slug => ' ////// My SLug fööbär  \\\\\\ ')
    post.slug.should eql('my-slug-fbr')
  end
  
  it "should keep the same slug if title is updated" do
    post = create(:post, :title => 'My Post')
    post.update_attributes(:title => 'other post')
    post.slug.should == 'my-post'
  end
  
  it "should not allow duplicate slugs" do
    a = create(:post, :slug => 'my-slug')
    b = build(:post, :slug => 'my-slug')
    b.should have_error_on(:slug).with_message("has already been taken")
  end
  
  it "should not be published by default" do
    post = build(:post)
    post.should_not be_published
  end
  
  it "should remove duplicate tags" do
    post = create(:post, :tags_string => 'tech, web, writing, web')
    post.tags.should == ['tech', 'web', 'writing']
  end
  
  it "should return tags as a comma separated string" do
    post = create(:post, :tags_string => 'tech, web, writing')
    post.tags_string.should == 'tech, web, writing'
  end
end
