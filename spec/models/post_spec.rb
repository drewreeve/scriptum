# encoding: UTF-8

require_relative '../spec_helper'

describe Post do
  
  it "should require a title" do
    post = Factory.build(:post, :title => "")
    post.should have_error_on(:title).with_message("can't be blank")
  end
  
  it "should generate a slug if one is not provided" do
    post = Factory.create(:post, :title => 'My Awesome Post')
    post.slug.should_not be_nil
  end
  
  it "should ensure slugs are properly formatted" do
    post = Factory.create(:post, :slug => ' ////// My SLug fööbär  \\\\\\ ')
    post.slug.should eql('my-slug-fbr')
  end
  
  it "should keep the same slug if title is updated" do
    post = Factory.create(:post, :title => 'My Post')
    post.update_attributes(:title => 'other post')
    post.slug.should == 'my-post'
  end
  
  it "should not allow duplicate slugs" do
    a = Factory.create(:post, :slug => 'my-slug')
    b = Factory.build(:post, :slug => 'my-slug')
    b.should have_error_on(:slug).with_message("has already been taken")
  end
  
end