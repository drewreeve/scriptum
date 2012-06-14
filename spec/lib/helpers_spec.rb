require_relative '../spec_helper'

describe Scriptum::Helpers do
  include Scriptum::Helpers
  
  context "page_title" do
    it "should separate multiple arguments" do
      page_title("b", "o", "o").should == "b | o | o"
    end

    it "should return single argument as string" do
      page_title("some string").should == "some string"
    end
  end

  context "valid_post_type" do
    it "should return true if valid" do
      valid_post_type?(Article).should be_true
    end
    
    it "should be false for post class" do
      valid_post_type?("post").should be_false
    end
    
    it "should be false for unknown class" do
      valid_post_type?('mypretendclass').should be_false
    end
  end
  
  context "build_post" do
    it "should return instance of class with attributes set" do
      post = build_post('article', {:title => 'mytitle', :body => 'text'})
      post.should be_an_instance_of Article
      post.title.should eql('mytitle')
    end
  end
  
  context "google_analytics" do
    it "should return nil if given a blank tracking_code" do
      google_analytics.should be_nil
    end

    it "should return js tracking code" do
      google_analytics("xx").should ==  <<-HTML
        <script type="text/javascript">
          var _gaq = _gaq || [];
          _gaq.push(['_setAccount', 'xx']);
          _gaq.push(['_trackPageview']);
          (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
          })();
        </script>
        HTML
    end
  end
end
