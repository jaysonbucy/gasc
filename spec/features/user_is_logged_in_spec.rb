require 'rails_helper'

RSpec.feature "When a user logs in" do
  before(:each) do
    visit new_user_session_path
    user = stub_email
    expect(page).to have_link("Sign In")
    click_link "Sign In"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"
  end

  scenario "they should see a control bar" do
    expect(page).to have_link("forms")
    expect(page).to have_link("terminology")
    expect(page).not_to have_link("email")
    expect(page).not_to have_link("calendar")
  end

  scenario "with a link to the swim forms" do
    click_link "forms"
    expect(page).to have_link("home")
    expect(page).to have_content("GASC Forms")
  end

  scenario "with a link to the terminology page" do
    click_link "terminology"
    expect(page).to have_link("home")
    expect(page).not_to have_link("terminology")
  end
end
