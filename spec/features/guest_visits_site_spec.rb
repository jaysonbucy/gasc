require 'rails_helper'

RSpec.describe 'user visits the site' do
  scenario 'as a guest' do
    visit root_path
    expect(page).to have_link('about')
    expect(page).to have_link('coaches')
    expect(page).to have_selector('iframe')
  end
end
