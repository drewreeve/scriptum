require_relative "../spec_helper"

describe Setting do

  it "should not allow blank site name" do
    s = Setting.new
    s.site_name= ""
    s.should_not be_valid
  end

  it "should not allow more than one setting record" do
    Setting.new.save
    s = Setting.new
    s.save.should be_false
    Setting.count.should == 1
  end
end
