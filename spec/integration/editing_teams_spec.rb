require "spec_helper"

feature "editing teams" do
  before do
    team = Factory.create(:team, name: "House Chores")
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
