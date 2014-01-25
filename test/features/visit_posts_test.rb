require "test_helper"

feature "VisitPosts" do
  scenario "a page of blog posts exist" do
    visit posts_path
    page.must_have_content posts(:one).title
    page.must_have_content posts(:two).body
  end
end
