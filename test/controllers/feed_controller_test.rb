require 'test_helper'

class FeedControllerTest < ActionController::TestCase
  test "it rejects unauthenticated users" do
    get "show"
    assert_redirected_to root_path 
  end
end
