require 'test_helper'

feature 'Delete Project' do
  scenario 'delete project from show page and return to index' do
    visit projects_path

    click_on projects(:one).description

    click_on 'Delete'

    current_path.must_equal projects_path
    page.wont_have_content projects(:one).description
  end
end
