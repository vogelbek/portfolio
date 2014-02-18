require 'test_helper'

feature 'CreatePost' do
  scenario 'create a new post' do
    visit posts_new_path

    login

    puts page.body

    fill_in 'Title', with: posts(:one).title
    fill_in 'Body', with: posts(:one).body

    click_on 'Create'

    page.must_have_content posts(:one).title
  end

  scenario 'validate post title' do
    visit posts_new_path

    login

    fill_in 'Title', with: ''
    fill_in 'Body', with: posts(:one).body

    click_on 'Create'

    current_path.must_equal posts_new_path
  end

  scenario 'validate post body' do
    visit posts_new_path

    login

    fill_in 'Title', with: posts(:one).title
    fill_in 'Body', with: ''

    click_on 'Create'

    current_path.must_equal posts_new_path
  end
end
