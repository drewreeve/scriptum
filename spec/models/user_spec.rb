require_relative "../spec_helper"

describe User do
  
  it "should require a username" do
    subject.should have_error_on(:username).with_message("can't be blank")
  end
  
end