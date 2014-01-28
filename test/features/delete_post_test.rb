require "test_helper"

feature "DeletePost" do
  scenario "a post can be deleted" do
    visit posts_path
    page.must_have_content posts(:one).title

    click_on "Delete #{posts(:one).title}"

    page.wont_have_content posts(:one).body
  end
end
