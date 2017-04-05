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
    fill_in 'user_first_name', with: 'Tester'
    fill_in 'user_last_name', with: 'Account'
    fill_in 'user_email', with: 'test.account@testing.test'
    fill_in 'user_password', with: 'userpassword'
    fill_in 'user_password_confirmation', with: 'userpassword'
    click_button 'Sign up'
    expect(page).to have_content('Welcome to the GASC')
  end

  scenario 'using an existing email' do
    stub_email
    visit new_user_registration_path
    fill_in 'user_first_name', with: 'Tester'
    fill_in 'user_last_name', with: 'Account'
    fill_in 'user_email', with: 'tester.account@testing.test'
    fill_in 'user_password', with: 'testing01'
    fill_in 'user_password_confirmation', with: 'testing01'
    click_button 'Sign up'
    expect(page).to have_content('Email has already been taken')
  end

  scenario 'using no email' do
    visit new_user_registration_path
    fill_in 'user_first_name', with: 'Tester'
    fill_in 'user_last_name', with: 'Account'
    fill_in 'user_email', with: ''
    fill_in 'user_password', with: 'testing01'
    fill_in 'user_password_confirmation', with: 'testing01'
    click_button 'Sign up'
    expect(page).to have_content('Email can\'t be blank')
    expect(page).to have_content('Email is too short (minimum is 3 characters)')
  end

  scenario 'using no name' do
    visit new_user_registration_path
    fill_in 'user_first_name', with: ''
    fill_in 'user_last_name', with: ''
    fill_in 'user_email', with: 'test.account@testing.test'
    fill_in 'user_password', with: 'userpassword'
    fill_in 'user_password_confirmation', with: 'userpassword'
    click_button 'Sign up'
    expect(page).to have_content('First name can\'t be blank')
    expect(page).to have_content('Last name can\'t be blank')
  end

  scenario 'using no password' do
    visit new_user_registration_path
    fill_in 'user_first_name', with: 'Tester'
    fill_in 'user_last_name', with: 'Account'
    fill_in 'user_email', with: 'test.account@testing.test'
    fill_in 'user_password', with: ''
    fill_in 'user_password_confirmation', with: ''
    click_button 'Sign up'
    expect(page).to have_content('Password can\'t be blank')
  end

  scenario 'using a short password' do
    visit new_user_registration_path
    fill_in 'user_first_name', with: 'Tester'
    fill_in 'user_last_name', with: 'Account'
    fill_in 'user_email', with: 'test.account@testing.test'
    fill_in 'user_password', with: 'word'
    fill_in 'user_password_confirmation', with: 'word'
    click_button 'Sign up'
    expect(page).to have_content('Password is too short (minimum is 6 characters)')
  end
end
