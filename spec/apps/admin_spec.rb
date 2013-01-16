require_relative "../spec_helper"

describe Scriptum::AdminApp, :type => :feature do
  
  it "should require authentication" do
    visit '/admin'
    current_path.should eql("/sessions/new")
  end
  
end