require "test_helper"

feature "Project comments" do
  scenario "Projects list comments" do
    visit project_path 1
    page.must_have_content comments(:one).comment
    page.must_have_content comments(:two).tldr
  end
end
