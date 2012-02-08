require 'test_helper'

class BlogTest < AcceptanceTestCase
  
  def test_index_returns_hello
    visit '/'
    assert_match /Hello World/, page.body
  end
end

