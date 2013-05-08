require "spec_helper"

feature "deleting teams" do
  scenario "can delete a team" do
    Factory(:team, name: "House Chores")
    visit '/'
    click_link "House Chores"
    click_link "Delete Team"
    page.should have_content("Your team has been deleted.")

    visit '/'
    page.should_not have_content("House Chores")
  end
end
