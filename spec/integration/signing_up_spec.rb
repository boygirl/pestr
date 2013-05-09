require "spec_helper"

feature "signing up" do
  scenario "successful signup" do
    visit '/'
    click_link 'Sign up'
    fill_in "Email", with: "user@pestr.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    page.should have_content("You have signed up successfully.")
  end
end
