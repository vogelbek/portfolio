require "test_helper"

feature "DeletePost" do
  scenario "a post can be deleted" do
    visit posts_path
    page.must_have_content posts(:one).title

    find("#Delete_#{posts(:one).id}", text: 'Delete').click

    page.wont_have_content posts(:one).body
  end
end
