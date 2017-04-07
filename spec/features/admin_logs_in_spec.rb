require 'rails_helper'

RSpec.feature "an admin logs in" do
  scenario "using email" do
    visit new_user_session_path
    stub_admin
    expect(page).to have_link("Sign In")
    click_link "Sign In"
    fill_in 'Email', with: 'tester.account@testing.test'
    fill_in 'Password', with: 'password01'
    click_button "Log in"
    expect(page).to have_link("Sign Out")
  end
end
