require_relative "../spec_helper"

describe Scriptum::AdminApp, :type => :request do
  
  it "should have content" do
    visit "/admin"
    page.should have_content('Hello')
  end
  
end