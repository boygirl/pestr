require "spec_helper"

feature "deleting members" do
  let!(:user)  { Factory(:confirmed_user) }
  let!(:team) { Factory(:team, name: "my awesome team") }
  let!(:member) { Factory(:member, name: "Boris", team_id: team.id) }
  before do
    sign_in_as!(user)
    visit '/'
    click_link(team.name)
  end

    scenario "delete a member" do
      within("#members #actions") do
        click_link "Delete"
      end
      page.should have_content("A member has been deleted")
      page.should_not have_content("Boris")
    end
end
