require 'test_helper'

feature 'EditPost' do
  scenario 'I can edit my post' do
    @update_content = 'Entirely New Content'
    visit posts_path

    find("#edit_#{posts(:one).id}", text: 'Edit').click

    fill_in 'Title', with: @update_content

    click_on 'Update'

    page.must_have_content @update_content
  end

  scenario 'I can go back to posts index' do
    visit post_path(id: posts(:one).id)

    click_on 'Return to Posts'

    page.must_have_content posts(:two).title
  end
end
