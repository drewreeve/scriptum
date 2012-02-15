require_relative '../spec_helper'

describe Scriptum::BlogApp, :type => :request do
  
  it "should say hello" do
    visit "/"
    page.should have_content('Hello World')
  end
  
end