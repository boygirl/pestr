require 'spec_helper'

  feature "Viewing teams" do
    let!(:user)  { Factory(:confirmed_user) }
  let!(:team) { Factory(:team, name: "my awesome team") }

  before do
    user.teams<<(team)
    sign_in_as!(user)
    visit '/'
  end

    scenario "listing all teams" do
    click_link 'my awesome team'
    page.current_url.should == team_url(team)
  end
end

