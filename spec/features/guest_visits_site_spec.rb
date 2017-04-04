require 'rails_helper'

RSpec.describe 'user visits the site' do
  scenario 'as a guest' do
    visit root_path
    expect(page).to have_button('about')
    expect(page).to have_button('coaches')
    expect(page).to have_selector('iframe')
  end
end
