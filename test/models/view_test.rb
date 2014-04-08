require "test_helper"

describe View do
  before do
    @view = View.new
  end

  it "must be valid" do
    @view.valid?.must_equal true
  end
end
