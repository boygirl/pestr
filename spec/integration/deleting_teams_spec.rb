require "spec_helper"

feature "deleting teams" do
  let!(:user)  { Factory(:confirmed_user) }
  let!(:team) { Factory(:team, name: "my awesome team") }
  before do
    user.teams<<(team)
    sign_in_as!(user)
    visit '/'
  end
  scenario "can delete a team" do
    click_link "my awesome team"
    click_link "Delete Team"
    page.should have_content("Your team has been deleted.")

    visit '/'
    page.should_not have_content("my awesome team")
  end
end
