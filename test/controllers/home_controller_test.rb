require "test_helper"

class HomeControllerTest < ActionController::TestCase
  test 'has index' do
    get :index
    assert_response :success
  end
end
