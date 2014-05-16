require "test_helper"

feature "A Editing A Post" do
  scenario "Editors can submit updates to an existing post" do
    # Given an existing post
   sign_in
    post = Post.create(title: posts(:cr).title, body: posts(:cr).body)
    visit posts_path(post)
    # When I click edit and submit changed data
    first(:link, "Edit").click
    fill_in "Title", with: posts(:http).title
    click_button "Update Post"
    # Then the post is updated
    page.text.must_include "Post was successfully updated"
    page.text.must_include posts(:http).title
  end

  scenario "Authors can submit updates to an existing post" do
    sign_in(:author)
    post = Post.create(title: posts(:cr).title, body: posts(:cr).body)
    visit posts_path(post)
    first(:link, "Edit").click
    fill_in "Title", with: "Hello"
    click_button "Update Post"
    # Then the post is updated
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Hello"
  end
end

