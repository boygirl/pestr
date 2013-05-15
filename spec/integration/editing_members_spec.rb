require "spec_helper"

feature "editing members" do
  let!(:user)  { Factory(:confirmed_user) }
  let!(:team) { Factory(:team, name: "my awesome team") }
  let!(:member) { Factory(:member, name: "Boris", team_id: team.id) }
  before do
    sign_in_as!(user)
    visit '/'
    click_link(team.name)
    within("#members #actions") do
      click_link "Edit"
    end
  end

  scenario "edit a member" do
    fill_in "Name", with: "Joris"
    fill_in "Phone", with: "2063694402"
    click_button "Update Member"
    page.should have_content "Membership has been updated"
  end

  scenario "don't create a member without a name" do
    fill_in "Name", with: ""
    click_button "Update Member"
    page.should have_content "Membership has not been updated"
  end

end
