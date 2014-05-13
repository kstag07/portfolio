require "test_helper"

feature "I want to edit a portfolio item so that I can update new project details" do
  scenario "The portfolio item should be changed from existing item" do
    visit edit_project_path(projects(:portfolio))
    fill_in "Name", with: "Kevin's Portfolio"
    click_on "Update Project"
    page.text.must_include "Success"
    page.text.must_include "Kevin's Portfolio"
    page.text.wont_include "Code Fellows Portfolio"
  end

  scenario "incorrectly editing an existing project" do
    #Given an existing project
    visit edit_project_path(projects(:portfolio))
    fill_in "Name", with: "Q"
    #When I submit invalid changes
    click_on "Update Project"
    page.text.must_include"prohibited"
    page.text.must_include "Name is too short"

    #Then the changes should not be save, and I should get to try again
  end

end
