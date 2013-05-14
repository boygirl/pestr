require "spec_helper"

feature "deleting todos" do
  let!(:user)  { Factory(:confirmed_user) }
  let!(:team) { Factory(:team, name: "my awesome team") }
  let!(:todo) { Factory(:todo, what: "clean something", team_id: team.id) }
  before do
    sign_in_as!(user)
    visit '/'
    click_link(team.name)
  end

    scenario "delete a todo" do
      within("#todos #actions") do
        click_link "Delete"
      end
      page.should have_content("Your todo has been deleted")
      page.should_not have_content("clean something")
    end
end
