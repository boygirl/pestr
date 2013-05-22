require "spec_helper"

feature "editing todos" do
  let!(:user)  { Factory(:confirmed_user) }
  let!(:team) { Factory(:team, name: "my awesome team") }
  let!(:todo) { Factory(:todo, team_id: team.id) }
  before do
    user.teams<<(team)
    sign_in_as!(user)
    visit '/'
    click_link(team.name)
    within("#todos #actions") do
      click_link "Edit"
    end
  end

  scenario "edit a todo" do
    fill_in "What", with: "Bathroom Cleaning"
    click_button "Update Todo"
    page.should have_content("Your todo has been updated.")
    page.should have_content("Bathroom Cleaning")
  end

  scenario "don't edit a todo with bad data" do
    fill_in "What", with: ""
    click_button "Update Todo"
    page.should have_content("Your todo has not been updated.")
  end
end
