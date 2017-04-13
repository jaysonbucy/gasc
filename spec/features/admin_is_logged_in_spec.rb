require 'rails_helper'

RSpec.feature "When and admin logs in" do
  before(:each) do
    visit new_user_session_path
    stub_admin
    expect(page).to have_link("Sign In")
    click_link "Sign In"
    fill_in 'Email', with: 'tester.account@testing.test'
    fill_in 'Password', with: 'password01'
    click_button "Log in"
  end

  scenario "they should see a user area" do
    expect(page).to have_link("Sign Out")
    expect(page).to have_css(".profile-image-gravatar")
  end

  scenario "they should see a control bar" do
    expect(page).to have_link("email")
    expect(page).to have_link("user")
    expect(page).to have_link("forms")
  end

  scenario "with a link to the user control panel" do
    click_link "user"
    expect(page).to have_link("Dashboard")
    expect(page).to have_link("Home")
    expect(page).to have_content("List of Users")
  end

  scenario "with a link to the swim forms control panel" do
    click_link "forms"
    expect(page).to have_link("Dashboard")
    expect(page).to have_link("Home")
    expect(page).to have_content("List of Swim forms")
  end

end
