require "test_helper"

feature "Twitter Sign In" do
  scenario "sign in with twitter works" do
    visit root_path
    click_on "Sign In"
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] =
      Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] =
      OmniAuth.config.mock_auth[:twitter]
    OmniAuth.config.add_mock :twitter, { uid: '12345', info: { nickname: 'test_twitter_user' }}
    click_on "Sign in with Twitter"
    page.must_have_content "test_twitter_user, you are signed in!"
  end
end
