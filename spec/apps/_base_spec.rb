require_relative "../spec_helper"

describe Scriptum::Base, :type => :request do
  
  it "should set cache headers" do
    visit "/"
    page.response_headers.should include('Cache-Control' => 'private, must-revalidate, max-age=0')
  end
  
end