require 'test_helper'


feature 'As a visitor I want to be able to comment on projects so I can give feedback' do
  scenario 'users can comment on projects' do
    visit projects_path
    first(:link, 'Show').click
    click_on 'new comment'
    fill_in 'Content', with: 'stuff'
    click_on 'Submit to be Approved'
    page.text.must_include 'Comment created.'
  end
end
