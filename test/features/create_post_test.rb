require "test_helper"

feature "CreatePost" do
  scenario "create a new post" do
    visit posts_new_path

    fill_in 'Title', with: posts(:one).title
    fill_in 'Body', with: posts(:one).body

    click_on 'Create'

    page.must_have_content posts(:one).title
  end
end
