require 'test_helper'

describe PostsController do
  it 'should get index' do
    get :index
    assert_response :success
  end

  it 'should get edit' do
    @test_id = Post.first.id

    get :edit, id: @test_id
    assert_response :success
  end

end
