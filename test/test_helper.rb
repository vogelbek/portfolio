ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  def login role = :editor
    visit new_admin_session_path
    fill_in 'Email', with: admin(role).email
    fill_in 'Password', with: 'password'

    click_on 'Sign in'
  end
end
