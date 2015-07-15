require 'rails_helper'

feature 'User creating' do

  scenario 'create user' do
    visit root_path

    expect{
      click_link 'Sign Up'
      fill_in 'First name', with: 'steve'
      fill_in 'Last name', with: 'jobs'
      fill_in 'Email', with: 'steve@apple.com'
      find('#password').fill_in 'Password', with: 'secret123'
      find('#password_confirmation').fill_in 'Password confirmation', with: 'secret123'
      click_button 'Sign up'
    }.to change(User, :count).by(1)
    expect(page).to have_content 'Sign Out'
  end
end
