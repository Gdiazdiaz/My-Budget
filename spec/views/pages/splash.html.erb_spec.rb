require 'rails_helper'

RSpec.describe '/pages/splash.html.erb', type: :feature do
  before do
    visit root_path
  end

  it 'shows logo picture for the app' do
    expect(page).to have_selector("img[src*='https://i.ibb.co/TbSdRjK/DALL-E-2023-04-25-23-49-11-logo-for-app-related-to-finance-removebg-preview.png']")
  end

  it 'Shows all recipes marked as public' do
    expect(page).to have_content('Budd-Get')
  end

  it 'redirects me to the login page' do
    link = find("a[href='#{new_user_session_path}']")
    link.click
    expect(page).to have_current_path(new_user_session_path)
  end

  it 'redirects me to the register page' do
    link = find("a[href='#{new_user_registration_path}']")
    link.click
    expect(page).to have_current_path(new_user_registration_path)
  end
end
