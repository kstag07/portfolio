require "test_helper"

feature "Creating A Post" do
  scenario "Authors can submit form to create a new post" do
    #Given a completed new post form
    sign_in(:author)
    visit new_post_path
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with:  posts(:cr).body
    #When I submit the form
    click_on "Create Post"
    #Then a new post should created an displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include("Status: Unpublished")
    page.text.must_include posts(:cr).title
     page.has_css? "#author"
    page.text.must_include users(:author).email
  end

  scenario "Editors can create a new post" do
    sign_in
    visit new_post_path
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with:  posts(:cr).body
    #When I submit the form
    click_on "Create Post"
    #Then a new post should created an displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include("Status: Unpublished")
    page.text.must_include posts(:cr).title
     page.has_css? "#editor"
    page.text.must_include users(:editor).email
  end

  scenario "unauthenticated site visitors cannot visit new post path" do
    visit new_post_path
    page.text.must_include "You need to sign in or sign up before continuing"
  end

  scenario "unauthenticated site visitors cannot see new post, destroy or edit links" do
    visit posts_path
    page.wont_have_content("New Post")
    page.wont_have_content("Destroy")
    page.wont_have_content("Edit")
  end

  scenario "authors can't publish" do
    sign_in(:author)
    visit new_post_path
    page.wont_have_field("published")
  end

  scenario "editors can publish" do
    sign_in(:editor)
    visit new_post_path
    page.must_have_field("Published")
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    check("Published")
    click_on("Create Post")
    page.text.must_include("Status: Published")
  end

  scenario "Authors cannot publish and get not authorized message when they try to" do
    sign_in(:author)
    visit new_post_path
    page.wont_have_field("Published")
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    click_on("Create Post")
    page.text.wont_include("Status: Published")
  end
end
