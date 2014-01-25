require "test_helper"

describe Posts do
  before do
    @posts = Posts.new
  end

  it "must be valid" do
    @posts.valid?.must_equal true
  end
end
