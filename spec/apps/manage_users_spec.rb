require_relative '../spec_helper'

describe Scriptum::ManageUsersApp, :type => :feature do

  [:author, :editor].each do |role|
    context "as #{role}" do
      before(:each) do
        sign_in_user(role)
      end

      let(:user) { User.first }

      it "should not allow creation of new users" do
        visit "/admin/users/new"
        current_path.should == "/admin"
        page.should have_content "You do not have permission"
      end

      it "should allow editing own user" do
        visit "/admin/users/#{user.id}/edit"
        fill_in "username", :with => "jamesbond"
        click_button "Save"
        page.should have_content "User updated"
        page.should have_content "jamesbond"
      end

      it "should not allow editing other users" do
        other_user = create(:user)
        visit "/admin/users/#{other_user.id}/edit"
        current_path.should == "/admin"
        page.should have_content "You do not have permission"
      end

      it "should not be able to delete any user" do
        other_user = create(:user)
        visit "/admin/users/#{other_user.id}/delete"
        current_path.should == "/admin"
        page.should have_content "You do not have permission"
      end
    end
  end

  context "as admin" do

    before(:each) do
      sign_in_user
    end

    it "should list users" do
      create(:user, :username => "test user")
      visit "/admin/users"
      page.should have_content("test user")
    end

    it "should create a user" do
      visit "/admin/users"
      click_link "New User"
      fill_in "username", :with => "joe"
      fill_in "password", :with => "mypass"
      fill_in "password_confirmation", :with => "mypass"
      click_button "Save"
      page.should have_content "User added"
      page.should have_content "joe"
    end

    it "should edit a user" do
      user = create(:user, :username => "bill")
      visit "/admin"
      click_link "Users"
      within "#user_bill td:first-child" do
        click_link "bill"
      end
      fill_in "username", :with => "ben"
      click_button "Save"
      page.should have_content "ben"
      page.should have_content "User updated"
    end

    it "should delete user and their posts" do
      u = create(:user)
      a = create(:article)
      visit "/admin/users"
      click_link "Delete #{a.user.username}"
      click_button "Delete User"
      page.should_not have_content a.user.username
      page.should have_content "User deleted"
    end

    it "should delete user and transfer their posts" do
      user1 = create(:user)
      user2 = create(:user)
      Scriptum::Authorship.stub(:change)
      Scriptum::Authorship.should_receive(:change).with(user2, user1)
      visit "/admin/users"
      click_link "Delete #{user2.username}"
      choose("reassign")
      select(user1.username)
      click_button "Delete User"
      page.should_not have_content user2.username
      page.should have_content "User deleted"
    end
  end
end
