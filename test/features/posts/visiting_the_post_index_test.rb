require "test_helper"

feature "Visiting The Post Index" do
  scenario "with existing posts, show list" do
    Post.create(title: posts(:cr).title, body: posts(:cr).body)
    visit posts_path
    page.text.must_include posts(:cr).title
  end

  scenario "Authors can only see their posts and not others" do
    sign_in(:author)
    visit posts_path
    page.text.must_include posts(:cr).title
    page.text.must_include users(:author).email
    page.text.wont_include posts(:http).title
  end

  scenario "Editors can see all posts published or unpublished" do
   sign_in
   visit posts_path
   page.text.must_include users(:editor).email
   page.text.must_include posts(:cr).title
   page.text.must_include posts(:manifest).title
  end

  scenario "Visitors can see all published posts" do
    visit posts_path
    page.text.must_include posts(:cr).title
    page.text.must_include posts(:http).title
    page.text.wont_include posts(:manifest).title
  end
end
