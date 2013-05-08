require 'spec_helper'

  feature "Viewing teams" do
    scenario "listing all teams" do
    team = Factory.create(:team, name: "House Chores")
    visit '/'
    click_link 'House Chores'
    page.current_url.should == team_url(team)
  end
end

