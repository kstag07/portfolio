require "test_helper"

feature "As a visitor I want to delete an existing post" do
  scenario "deleting a project" do
    visit projects_path
    first(:link, "Destroy").click
    page.body.wont_include "Code Fellows"
    page.body.must_include "Post was successfully destroyed."
  end
end
