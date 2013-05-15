require "spec_helper"

feature "creating members" do
  let!(:user)  { Factory(:confirmed_user) }
  let!(:team) { Factory(:team, name: "my awesome team") }
  before do
    sign_in_as!(user)
    visit '/'
    click_link(team.name)
    click_link "New Member"
  end

  scenario "create a new member" do
    fill_in "Name", with: "Boris"
    fill_in "Phone", with: "2063694402"
    click_button "Create Member"
    page.should have_content "A new member has been added to your team!"
  end

  scenario "don't create a member without a name" do
    click_button "Create Member"
    page.should have_content "No one was added to your team."
  end

end
