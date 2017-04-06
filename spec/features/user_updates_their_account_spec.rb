require 'rails_helper'

RSpec.feature "a user updates their account" do
  scenario "while logged in" do
    visit new_user_session_path
    user = stub_email
    expect(page).to have_link("Sign In")
    click_link "Sign In"
    fill_in 'Email', with: 'tester.account@testing.test'
    fill_in 'Password', with: 'password01'
    click_button "Log in"
    expect(page).to have_link(user.first_name + " " + user.last_name)
    click_link user.first_name + " " + user.last_name
    fill_in 'user_first_name', with: 'Testing'
    fill_in 'user_current_password', with: 'password01'
    click_button "Update"
    expect(page).to have_link('Testing ' + user.last_name)
  end
end
