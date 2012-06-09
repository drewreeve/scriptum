require_relative "../spec_helper"

describe Scriptum::ManageSettings, :type => :request do

  before do
    sign_in_user
  end

  it "should update settings" do
    visit "/admin/settings"
    fill_in "site_name", :with => "cflux"
    click_button "Save Settings"
    page.should have_content "cflux"
    page.should_not have_content "problem"
  end


  it "should display error with invalid settings" do
    visit "/admin/settings"
    fill_in "site_name", :with => ""
    click_button "Save Settings"
    page.should have_content "problem"
  end
end