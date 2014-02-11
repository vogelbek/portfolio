require 'test_helper'

feature 'View Project' do
  scenario 'there is an index page' do
    visit projects_path

    page.must_have_content projects(:one).description
    page.must_have_content projects(:two).description
  end
  scenario 'there is a show for each project' do
    visit projects_path

    click_on projects(:one).description

    page.must_have_content projects(:one).description
    page.wont_have_content projects(:two).description
  end
end
