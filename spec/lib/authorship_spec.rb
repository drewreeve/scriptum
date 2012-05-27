require_relative "../spec_helper"

module Scriptum
  describe Authorship do

    it "should set author of posts to new user" do
      user1 = create(:user)
      user2 = create(:user)
      article1 = create(:article, :user => user1)
      article2 = create(:article, :user => user2)

      Authorship.change(user1, user2)
      user1.posts.count.should == 0
      user2.posts.count.should == 2
    end
  end
end
