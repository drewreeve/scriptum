require_relative '../spec_helper'

describe Link do
  
  it "should require a url" do
    link = build(:link, :url => '')
    link.should have_error_on(:url).with_message("can't be blank")
  end
  
  it "should require a description" do
    link = build(:link, :description => '')
    link.should have_error_on(:description).with_message("can't be blank")
  end
  
  it "should format description with markdown" do
    link = create(:link, :description => 'some **text**')
    link.description_html.should eql("<p>some <strong>text</strong></p>")
  end
  
end