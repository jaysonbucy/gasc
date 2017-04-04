require 'rails_helper'

RSpec.describe 'user registers'do
  scenario "using google oauth2" do
    stub_omniauth
    visit new_user_session_path
    expect(page).to have_link("Sign In")
    click_link "Sign In"
    expect(page).to have_link(href: user_google_oauth2_omniauth_authorize_path)
    click_link href: user_google_oauth2_omniauth_authorize_path
    expect(page).to have_content("Welcome to the GASC")
    expect(page).to have_link("Sign Out")
  end

  scenario 'using an email' do
    visit new_user_registration_path
    fill_in 'user_firstname', with: 'Tester'
    fill_in 'user_lastname', with: 'Account'
    fill_in 'user_email', with: 'test.account@testing.test'
    fill_in 'user_password', with: 'userpassword'
    fill_in 'user_password_confirmation', with: 'userpassword'
    click_button 'Sign up'
    expect(page).to have_content('Welcome to the GASC')
  end
end
