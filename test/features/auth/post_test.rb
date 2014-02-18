require "test_helper"

feature "Authentication for posts" do
  scenario "Posts index is open to all users" do
    visit posts_path

    page.wont_have_content 'You need to sign in or sign up before continuing.'
  end
  scenario "Posts edit requires login" do
    visit posts_path

    find("#edit_#{posts(:one).id}", text: 'Edit').click
    page.must_have_content 'You need to sign in or sign up before continuing.'
  end
end
