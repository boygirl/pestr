require "spec_helper"

feature "creating todos" do
  let!(:user)  { Factory(:confirmed_user) }
  let!(:team) { Factory(:team, name: "my awesome team") }
  before do
    sign_in_as!(user)
    visit '/'
    click_link(team.name)
    click_link "New Todo"
  end

  scenario "create a todo" do
    fill_in "What", with: "Clean the House"
    click_button "Create Todo"
    page.should have_content("Your todo has been created.")
  end
end
