require "spec_helper"

feature "Signing in" do
  before do
    Factory(:user, email: "pestr@example.com")
  end

  scenario "sign in with confirmation" do
    open_email "pestr@example.com"
    click_first_link_in_email
    page.should have_content("Your account was successfully confirmed.")
    page.should have_content("Signed in as pestr@example.com")
  end

  scenario "sign in via form" do
    User.find_by_email("pestr@example.com").confirm!
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: "pestr@example.com"
    fill_in 'Password', with: "password"
    click_button "Sign in"
    page.should have_content("Signed in successfully.")
  end
end
