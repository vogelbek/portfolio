require 'test_helper'

feature 'PostsIndex' do
  scenario 'a potential employer visits the blog index' do
    visit posts_path
    page.must_have_content posts(:one).title
    page.must_have_content posts(:two).body
  end
end
