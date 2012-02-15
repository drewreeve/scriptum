require 'test_helper'

class BaseTest < AcceptanceTestCase
  
  def setup
    Capybara.app = Scriptum::Base
  end
  
  def test_sets_correct_cache_headers
    visit '/'
    assert_equal 'private, must-revalidate, max-age=0', page.response_headers['Cache-Control']
  end
end