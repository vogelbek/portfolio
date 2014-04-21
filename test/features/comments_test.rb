require 'test_helper'

feature 'Project comments' do
  scenario 'Projects list thier own comments' do
    visit project_path 1
    page.must_have_content comments(:one).comment
    page.must_have_content comments(:two).tldr
    page.wont_have_content comments(:three).comment
    page.wont_have_content comments(:four).comment
  end
  scenario 'Projects without comments should not have empty braces' do
    visit project_path 2
    page.wont_have_content comments(:one).comment
    page.wont_have_content '[]'
  end
end
