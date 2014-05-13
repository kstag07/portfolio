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


    scenario "new project has invalid data" do
       # Given invalid project data is entered in a form
       visit new_project_path
    # When the form is submitted with a short name and missing technologies_used field
        fill_in "Name", with: "M"
        click_on "Create Project"
    # Then the form should be displayed again, with an error message
        current_path.must_match /projects$/
        page.text.must_include "Project could not be saved"
        page.text.must_include "Name is too short"
        page.text.must_include "Technologies used can't be blank"
    end
end
