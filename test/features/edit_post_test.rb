require 'test_helper'

feature 'EditPost' do
  scenario 'I can edit my post' do
    @update_content = 'Entirely New Content'
    visit posts_path

    click_on 'Edit'

    fill_in 'Title', with: @update_content

    click_on 'Update'

    page.must_have_content @update_content
  end
end
