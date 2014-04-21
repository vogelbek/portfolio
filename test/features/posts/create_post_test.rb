require 'test_helper'

feature 'CreatePost' do
  scenario 'create a new post' do
    visit new_post_path

    login

    fill_in 'Title', with: posts(:one).title
    fill_in 'Body', with: posts(:one).body

    click_on 'Create'

    page.must_have_content posts(:one).title
  end

  scenario 'validate post title' do
    visit new_post_path

    login

    fill_in 'Title', with: ''
    fill_in 'Body', with: posts(:one).body

    click_on 'Create'

    current_path.must_equal new_post_path
  end

  scenario 'validate post body' do
    visit new_post_path

    login

    fill_in 'Title', with: posts(:one).title
    fill_in 'Body', with: ''

    click_on 'Create'

    current_path.must_equal new_post_path
  end

  scenario "unauthenticated site visitors cannot visit new_post_path" do
    visit new_post_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

  scenario "unauthenticated site vistiors cannot see new post button" do
    # When I visit the blog index page
    visit posts_path
    # Then I should not see the "New Post" button
    page.wont_have_link "New Post"
  end

  scenario "authors can't publish" do
    # Given an author's account
    login(:author)

    # When I visit the new page
    visit new_post_path

    # There is no checkbox for published
    page.wont_have_field('published')
  end

  scenario "editors can publish" do
    # Given an editor's account
    login(:editor)

    # When I visit the new page
    visit new_post_path

    # There is a checkbox for published
    page.must_have_field('Published')

    # When I submit the form
    fill_in "Title", with: posts(:one).title
    fill_in "Body", with: posts(:one).body
    check "Published"
    click_on "Create Post"

    # Then the published post should be shown
    page.text.must_include "Published"
  end
end

