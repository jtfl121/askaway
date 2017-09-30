require 'rails_helper'

RSpec.feature 'Signup user' do 

  before do
    @user = FactoryGirl.build(:user)

  end

  scenario "user can sign up with valid creds" do
    visit root_path
    click_link "Sign In"
    click_link "Sign up"
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    fill_in 'Password confirmation', with: @user.password_confirmation
    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')

  end  

end