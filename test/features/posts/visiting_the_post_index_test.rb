require "test_helper"

feature "Visiting The Post Index" do
  scenario "with existing posts, show list" do
    Post.create(title: posts(:cr).title, body: posts(:cr).body)
    visit posts_path
    page.text.must_include posts(:cr).title
  end
end
