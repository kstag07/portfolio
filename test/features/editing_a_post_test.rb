require "test_helper"

feature "Editing A Post" do
  scenario "submit updates to an existing post" do
    # Given an existing post
    post = Post.create(title: posts(:cr).title, body: posts(:cr).body)
    visit post_path(post)
    # When I click edit and submit changed data
    click_on "Edit"
    fill_in "Title", with: posts(:http).title
    click_on "Update Post"
    # Then the post is updated
    page.text.must_include "Post was successfully updated"
    page.text.must_include posts(:http).title
  end
end
