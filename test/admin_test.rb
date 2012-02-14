require 'test_helper'

class AdminTest < AcceptanceTestCase
  
  def test_index_returns_hello
    visit '/admin'
    assert_match /Hello/, page.body
  end
end