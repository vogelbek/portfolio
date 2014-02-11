require "test_helper"

feature "CreateProject" do
  scenario "Create a new project" do
    visit projects_new_path

    fill_in 'Description', with: projects(:one).description

    click_on 'Create'

    page.must_have_content projects(:one).description
  end
end
