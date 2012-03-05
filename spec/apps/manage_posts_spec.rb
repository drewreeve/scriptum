require_relative '../spec_helper'

describe Scriptum::ManagePostsApp, :type => :request do
  
  before(:each) do
    sign_in_user
  end
  
  it "should list posts" do
    Factory.create(:article, :title => 'my article')
    Factory.create(:link, :title => 'my link')
    visit "/admin/posts"
    page.should have_content 'my article'
    page.should have_content 'my link'
  end
  
  it "should create a post" do
    visit "/admin/posts"
    click_link "Article"
    current_path.should eql("/admin/posts/new/article")
    fill_in "title", :with => "awesome post"
    fill_in "body", :with => "lorem ipsum"
    click_button "Save"
    page.should have_content "awesome post"
    page.should have_content "Post created"
  end
  
  it "should show error when creating invalid post" do
    visit "/admin/posts"
    click_link "Article"
    current_path.should eql("/admin/posts/new/article")
    fill_in "title", :with => ""
    fill_in "body", :with => "lorem ipsum"
    click_button "Save"
    page.should have_content "There was a problem"    
  end
  
  it "should edit a post" do
    post = Factory.create(:article, :title => "mytitle")
    visit "/admin/posts"
    click_link "mytitle"
    fill_in "title", :with => "my new title"
    click_button "Save Changes"
    page.should have_content "my new title"
    page.should have_content "Post updated"
  end
  
  it "should show error when updating an invalid post" do
    post = Factory.create(:article, :title => "mytitle")
    visit "/admin/posts"
    click_link "mytitle"
    fill_in "title", :with => ""
    click_button "Save Changes"
    page.should have_content "There was a problem"
  end
  
  it "should delete a post"
  
end