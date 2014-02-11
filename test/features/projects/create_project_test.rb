require 'test_helper'

feature 'CreateProject' do
  scenario 'Create a new project' do
    visit '/projects/new'

    fill_in 'Description', with: projects(:one).description

    click_on 'Create'

    page.must_have_content projects(:one).description
  end

  scenario 'Cant create without Description' do
    visit '/projects/new'

    fill_in 'Description', with: ''

    current_path.must_equal '/projects/new'
  end
end
