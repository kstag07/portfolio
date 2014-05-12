require "test_helper"

feature "As the site owner, I want to added a portfolio item so that I can show off my work" do
  scenario "The newly added Project should be created" do
    visit projects_path
    click_on "New Project"
    fill_in "Name", with: "Code Fellows Portfolio"
    fill_in "Technologies used", with: "Ruby, Rails, Foundation, html, css"
    click_on "Create Project"
    page.text.must_include "Project has been created"
    page.text.must_include "Code Fellows"
    page.text.must_include "Rails"
  end
end
