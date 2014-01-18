require "test_helper"

class HasHomeTest < Capybara::Rails::TestCase
  test "Root has my name" do
    visit root_path
    assert_content page, "Adam Hendricksen"
  end
end
