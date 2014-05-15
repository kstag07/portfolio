require "test_helper"

feature "Deleting A Post" do
  scenario "post is deleted with a click" do
    #Given an existing post
    post = posts(:cr).title, posts(:cr).body
    visit posts_path
    #When the delete link is clicked
    page.find("tbody tr:last").click_on "Destroy"
    #Then the post is deleted
    page.wont_have_content posts(:cr).title

  end
end
