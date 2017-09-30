RSpec.feature 'Signup user' do 

  before do
    @user = FactoryGirl.create(:user)

  end


  scenario "user can sign up with valid creds" do
    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content(@user.email)

  end

  scenario "user can sign up with valid creds" do
    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    click_link "Logout"

    expect(page).to have_content('Signed out successfully.')
    expect(page).not_to have_content(@user.email)

  end

end