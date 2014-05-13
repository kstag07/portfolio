require "test_helper"

feature "As a visitor when I click on the project I want to only show that project" do
  scenario "showing a project" do
    visit projects_path
   first(:link, "Show").click
    page.body.must_include "Code Fellows"
    page.body.wont_include "Kevin"
  end
end
