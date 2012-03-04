require_relative '../spec_helper'

describe Scriptum::ManagePostsApp, :type => :request do
  
  it "should list posts" do
    Factory.create(:article, :title => 'my article')
    Factory.create(:link, :title => 'my link')
    sign_in_user
    visit "/admin/posts"
    page.should have_content('my article')
    page.should have_content('my link')
  end
  
end