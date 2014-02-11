require "test_helper"

feature "CreateProject" do
  scenario "Create a new project" do
    visit '/projects/new'

    fill_in 'Description', with: projects(:one).description

    click_on 'Create'

    page.must_have_content projects(:one).description
  end
end
