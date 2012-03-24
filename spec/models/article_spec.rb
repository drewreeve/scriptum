require_relative '../spec_helper'

describe Article do

  it "should require a body" do
    article = build(:article, :body => '')
    article.should have_error_on(:body).with_message("can't be blank")
  end

  it "should format body with markdown" do
    article = create(:article, :body => 'some _text_ using **markdown**')
    article.body_html.should eql("<p>some <em>text</em> using <strong>markdown</strong></p>")
  end

  it "should format excerpt with markdown" do
    article = create(:article, :excerpt => 'some _text_ using **markdown**')
    article.excerpt_html.should eql("<p>some <em>text</em> using <strong>markdown</strong></p>")
  end

  it "should set excerpt_html to nil when removing an excerpt" do
    a = create(:article)
    a.update_attributes(:excerpt => "")
    a.reload.excerpt.should be_nil
    a.reload.excerpt.should be_nil
  end

end