require_relative "../spec_helper"

describe Scriptum::ManageSettings, :type => :feature do

  context "as admin" do
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

  context "as editor" do
    it "should redirect and deny access" do
      sign_in_user(:editor)
      visit "/admin/settings"
      page.should have_content ("You do not have permission")
      current_path.should == "/admin"
    end
  end

  context "as author" do
    it "should redirect and deny access" do
      sign_in_user(:author)
      visit "/admin/settings"
      page.should have_content ("You do not have permission")
      current_path.should == "/admin"
    end
  end
end
