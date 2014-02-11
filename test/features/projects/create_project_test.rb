require 'test_helper'

feature 'CreateProject' do
  before :all do
    @new_path = '/projects/new'
  end
  scenario 'Create a new project' do
    visit @new_path

    fill_in 'Description', with: projects(:one).description

    click_on 'Create'

    page.must_have_content projects(:one).description
  end

  scenario 'Cant create without Description' do
    visit @new_path

    fill_in 'Description', with: ''

    current_path.must_equal '/projects/new'
  end
end
