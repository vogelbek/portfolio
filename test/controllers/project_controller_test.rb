require "test_helper"

describe ProjectController do
  it "should get index" do
    get :index
    assert_response :success
  end

  it "should get show" do
    get :show
    assert_response :success
  end

end
