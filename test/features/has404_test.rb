require 'test_helper'

class Has404Test < Capybara::Rails::TestCase
  test 'page doesn\'t exist' do
    visit '/404'
    assert_content page, 'The page you were looking for doesn\'t exist.'
    refute_content page, 'Welcome aboard'
  end
end
