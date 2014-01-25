require "test_helper"

describe PostsController do
  it "should get show" do
    get :show
    assert_response :success
  end

end
