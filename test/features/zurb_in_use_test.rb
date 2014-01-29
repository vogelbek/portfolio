require 'test_helper'

feature 'ZurbInUse' do
  scenario 'determine if compiled Zurb is in css' do
    visit '/assets/application.css?body=1'

    page.must_have_content 'foundation'
  end
end
