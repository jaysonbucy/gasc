require 'rails_helper'

RSpec.feature "When a user logs in" do
  before(:each) do
    visit new_user_session_path
    stub_email
    expect(page).to have_link("Sign In")
    click_link "Sign In"
    fill_in 'Email', with: 'tester.account@testing.test'
    fill_in 'Password', with: 'password01'
    click_button "Log in"
  end

  scenario "they should see a control bar" do
    expect(page).to have_link("forms")
    expect(page).to have_link("terminology")
    expect(page).to have_link("forum")
    expect(page).to have_link("payment")
    expect(page).not_to have_link("email")
    expect(page).not_to have_link("calendar")
  end

  scenario "with a link to the swim forms" do
    click_link "forms"
    expect(page).to have_link("home")
    expect(page).to have_content("GASC Forms")
  end
end
