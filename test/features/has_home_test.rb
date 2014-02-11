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

  test "Root has project descriptions" do
    visit root_path

    page.must_have_content projects(:one).description
  end

  test "Root's projects are show links" do
    visit root_path

    click_on projects(:two).description

    page.must_have_content projects(:two).description
    current_path.must_equal project_path(id: projects(:two).id)
  end
end
