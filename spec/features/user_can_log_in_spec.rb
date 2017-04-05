require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using google oauth2" do
    stub_omniauth
    visit new_user_session_path
    expect(page).to have_link("Sign In")
    click_link "Sign In"
    expect(page).to have_link(href: user_google_oauth2_omniauth_authorize_path)
    click_link href: user_google_oauth2_omniauth_authorize_path
    expect(page).to have_link("Sign Out")
    expect(page).to have_button("forms")
    expect(page).to have_button("forum")
    expect(page).to have_button("terminology")
    expect(page).to have_button("payment")
  end

  scenario "using email" do
    visit new_user_session_path
    stub_email
    expect(page).to have_link("Sign In")
    click_link "Sign In"
    fill_in 'Email', with: 'tester.account@testing.test'
    fill_in 'Password', with: 'password01'
    click_button "Log in"
    expect(page).to have_link("Sign Out")
    expect(page).to have_button("forms")
    expect(page).to have_button("forum")
    expect(page).to have_button("terminology")
    expect(page).to have_button("payment")
  end
end
