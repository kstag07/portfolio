require "test_helper"

feature "As a user I want to be able to sign in if I have an existing account" do
  scenario "Sign in" do
    visit root_path
    first(:link, "Sign in").click
    #When I register with valid info
    fill_in "Email", with: users(:King).email
    fill_in "Password", with: 'password'
    click_button("Sign in")
    page.must_have_content "Signed in successfully"
    page.wont_have_content "Sign in"
  end

   scenario "sign in with twitter works" do
   visit root_path
    first(:link, "Sign in").click
   OmniAuth.config.test_mode = true
   Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
   Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
   OmniAuth.config.add_mock(:twitter,
                            {
                            uid: '12345',
                            info: { nickname: 'test_twitter_user'},
                            })
   first(:link,"Sign in with Twitter").click
   save_and_open_page
   page.must_have_content "test_twitter_user, you are signed in!"
  end
end
