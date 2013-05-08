require 'spec_helper'

feature "creating teams" do
  scenario "can create a team" do
    visit '/'
    click_link 'New Team'
    fill_in 'Name', with: 'House Chores'
    click_button 'Create Team'
    page.should have_content('Your team has been created.')

    team = Team.find_by_name("House Chores")
    page.current_url.should == team_url(team)
    title = "House Chores - Teams - Pestr"
    find("title").should have_content(title)
  end
end
