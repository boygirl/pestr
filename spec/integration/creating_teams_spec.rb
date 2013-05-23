require 'spec_helper'

feature "creating teams" do
  let!(:user) { Factory(:confirmed_user, name: "Lauren") }
  before do
    sign_in_as!(user)
    visit '/'
    click_link 'Create Team'
  end
  scenario "can create a team" do
    fill_in 'Name', with: 'House Chores'
    click_button 'Create Team'
    page.should have_content('Your team has been created.')
  end

  scenario "cannot create a team without a name" do
    click_button 'Create Team'
    page.should have_content("Your team was not created.")
    page.should have_content("Name can't be blank")
  end

  scenario "Team membership includes creator" do
    fill_in 'Name', with: 'Build a Sauna'
    click_button 'Create Team'
    page.should have_content('Lauren')
  end
end
