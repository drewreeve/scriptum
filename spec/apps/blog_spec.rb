require_relative '../spec_helper'

describe Scriptum::BlogApp, :type => :request do
  
  it "should list tumblelog content" do
    Factory.create(:article, :title => 'my article')
    Factory.create(:link, :title => 'my link')
    visit "/"
    page.should have_content('my article')
    page.should have_content('my link')
  end
  
  it "should show individual posts" do
    a = Factory.create(:article)
    visit "/post/#{a.slug}"
    page.should have_content(a.title)
  end
  
end