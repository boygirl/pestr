require 'spec_helper'

feature 'inviting users' do
  let!(:user) { Factory(:confirmed_user) }
  let!(:team) { Factory(:team, name: "my awesome team") }

  before do
    sign_in_as!(user)
    team.users<<(user)
    visit '/'
    click_link(team.name)
    click_link 'Invite Administrator'
  end

  scenario 'User can invite another user' do
    fill_in "Email", :with => "newuser#{rand(1000)}@pestr.com"
    click_button "Send an invitation"
    page.should have_content ("New user has been invited!")
  end

  scenario 'Users can sign up via invite' do
    user_email = "newuser#{rand(1000)}@pestr.com"
    fill_in "Email", :with => user_email
    click_button "Send an invitation"
    click_link "Sign out"
    open_email user_email, :with_subject => "You've been invited to Pestr!"
    click_email_link_matching(/invitation/)
    page.should have_content("Set your password")
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Set my password"
    page.should have_content("Welcome to Pestr! You are now signed in!")
    page.should have_content("Signed in as #{user_email}")
  end
end
