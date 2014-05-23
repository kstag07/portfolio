require 'test_helper'

feature "Comment features on blog posts" do
  scenario "Visitors can comment on blog posts" do
    visit posts_path
    page.find("tbody tr:last").click_on "Show"
    fill_in "Content", with: "Great Comment"
    click_button "Submit to be Approved"
    page.text.must_include "submitted"
    page.text.wont_include "Great Comment"
  end


  scenario "Editors and Authors both can approve comments before submission" do
    sign_in(:author)
    visit posts_path
    page.find("tbody tr:last").click_on "Show"
    fill_in "Content", with: "Great Comment"
    page.must_have_field "Approved"
    check "Approved"
    click_button "Submit to be Approved"
    page.text.must_include "Approved"
    page.text.must_include "Great Comment"
  end

end

