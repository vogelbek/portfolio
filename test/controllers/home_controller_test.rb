require "test_helper"

class HomeControllerTest < ActionController::TestCase
  test 'has index' do
    assert_respond_to HomeController, :index
  end
end
