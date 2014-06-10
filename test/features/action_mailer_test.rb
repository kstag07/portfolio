require 'test_helper'

feature 'Can Send email' do
  scenario 'a visitor can send contact' do
    visit root_path
    fill_in "Email", with: "narnar@nar.com"
    fill_in "Name", with: "Kevin"
    fill_in "Content", with: "blach blach"
    click_on "Submit to be Approved"
    page.text.must_include "Message sent from Kevin"
  end
end
