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
end
