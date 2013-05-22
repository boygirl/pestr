require "spec_helper"

feature "editing teams" do
  let!(:user)  { Factory(:confirmed_user) }
  let!(:team) { Factory(:team, name: "House Chores") }

  before do
    sign_in_as!(user)
    user.teams<<(team)
    visit '/'
    click_link 'House Chores'
    click_link "Edit Team"
  end
  scenario "teams can be edited" do
    fill_in "Name", with: "Our House"
    click_button "Update Team"
    page.should have_content("Your team has been updated.")
  end

  scenario "don't edit teams with bad data" do
    fill_in "Name", with: ""
    click_button "Update Team"
    page.should have_content("Your team was not updated.")

  end
end
