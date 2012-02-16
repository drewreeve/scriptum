require_relative "../spec_helper"

describe User do
  
  it "should require a username" do
    subject.should have_error_on(:username).with_message("can't be blank")
  end
  
  it "should require a password" do
    subject.should have_error_on(:password).with_message("can't be blank")
  end
  
  it "should require a unique username" do
    Factory.create(:user, :username => 'dude')
    u = Factory.build(:user, :username => 'dude')
    u.save
    u.should have_error_on(:username).with_message("has already been taken")
  end
  
  it "should encrypt the password" do
    u = Factory.create(:user)
    u.encrypted_password.should_not be_nil
  end
  
  it "should not change encrypted password when updating" do
    Factory.create(:user, :username => "newuser")
    u = User.find_by_username("newuser")
    original_pass = u.encrypted_password
    u.save
    u.encrypted_password.should eql(original_pass)
  end
  
  it "should re-encrypt if password has changed" do
    u = Factory.create(:user)
    u.password = "newpassword"
    u.password_confirmation = "newpassword"
    expect { u.save }.to change{u.encrypted_password}
  end
  
  it "should authenticate" do
    u = Factory.create(:user, :username => 'dude', :password => 'mypass')
    User.authenticate('dude', 'mypass').should == u
  end
end