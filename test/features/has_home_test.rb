require "test_helper"

class HasHomeTest < Capybara::Rails::TestCase
  test "sanity" do
    visit root_path
    assert_content page, "Adam Hendricksen"
  end
end
