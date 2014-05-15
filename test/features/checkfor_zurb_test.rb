require 'test_helper'

feature 'CheckforZurb' do
  scenario 'zurb foundation loading on root path' do
    visit root_path
    page.body.must_include 'columns'
    #page.html.must_include 'foundation_and_overrides.css'
  end
end
