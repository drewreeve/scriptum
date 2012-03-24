require_relative '../spec_helper'

describe Scriptum::UserSessionApp, :type => :request do
  
  it "should sign me in" do
    u = create(:user, :username => 'bob', :password => 'password')
    visit "/sessions/new"
    fill_in 'username', :with => 'bob'
    fill_in 'password', :with => 'password'
    click_on 'Sign in'
    page.should have_content("signed in")
    current_path.should eql('/admin')
  end
  
  it "should show an error message with bad credentials" do
    visit "/sessions/new"
    fill_in 'username', :with => 'bob'
    fill_in 'password', :with => 'pass'
    click_on 'Sign in'
    page.should have_content("Invalid username or password")
  end
  
  context "when signing out" do
    
    before(:each) do
      @user = create(:user, :username => 'bob', :password => "password")
      visit "/sessions/new"
      fill_in 'username', :with => 'bob'
      fill_in 'password', :with => 'password'
      click_on 'Sign in'
    end
    
    it "should sign me out" do
      visit "/sessions/logout"
      page.should have_content("signed out")
      visit "/admin"
      current_path.should eql('/sessions/new')
    end
    
  end
  
end