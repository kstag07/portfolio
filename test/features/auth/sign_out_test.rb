require "test_helper"

feature "As a user I want to be able to sign out of my session" do
  scenario "sign out" do
    #Given a registration form
    visit "/"
 first(:link, "Sign in").click
    #When I register with valid info
    fill_in "Email", with: users(:King).email
    fill_in "Password", with: 'password'
    click_button("Sign in")
    click_on "Sign out"

    page.wont_have_content "kstag@yahoo.com"
    page.must_have_content "Signed out successfully."
  end
end
