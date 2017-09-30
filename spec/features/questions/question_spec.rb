require 'rails_helper'

RSpec.feature 'Questions' do 
  scenario 'Guest user' do
    visit root_path
    expect(find('body h1')).to have_content('Top 10 questions') 
  end


  scenario 'A user can create a question' do
    visit root_path

    click_link "New Question"

    visit new_question_path

    fill_in "Body", with: "This is my question"

    click_button "Ask question"

    expect(page).to have_content("New question asked")
    expect(page.current_path).to eq(root_path)
  end
  
end