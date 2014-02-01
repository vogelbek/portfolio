require "test_helper"

class HasHomeTest < Capybara::Rails::TestCase
  test "Root has my name" do
    visit root_path
    assert_content page, "Adam Hendricksen"
  end

  test "Root has post titles" do
    visit root_path

    page.must_have_content posts(:one).title
  end

  test "Root's post titles are anchor links" do
    visit root_path

    click_on posts(:two).title

    page.must_have_content posts(:two).body
  end
end
