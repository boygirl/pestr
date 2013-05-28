require "spec_helper"

feature "creating todos" do
  let!(:user)  { Factory(:confirmed_user) }
  let!(:team) { Factory(:team, name: "my awesome team") }

  before do
    user.teams<<(team)
    sign_in_as!(user)
    visit '/'
    click_link(team.name)
  end

  scenario "create a todo" do
    fill_in "what", with: "Clean the House"
    click_button "Create Todo"
    page.should have_content("Your todo has been created.")
  end

  scenario "don't create a todo with bad data" do
    click_button "Create Todo"
    page.should have_content("Your todo has not been created.")
  end
end
