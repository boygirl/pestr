require 'spec_helper'

feature "creating teams" do
  scenario "can create a team" do
    visit '/'
    click_link 'New Team'
    fill_in 'Name', with: 'House Chores'
    click_button 'Create Team'
    page.should have_content('Your team has been created.')
  end
end
