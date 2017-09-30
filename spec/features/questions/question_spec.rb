require 'rails_helper'

RSpec.feature 'Questions' do 

  scenario 'A user can create a question' do
    visit root_path

    click_link "New Question"

    visit new_question_path

    fill_in "Question", with: "This is my question"

    click_button "Ask question"

    expect(page).to have_content("New question asked")
    expect(page.current_path).to eq(root_path)
  end

  scenario "A user fails to create a new article" do 
    
    visit root_path
    
    click_link "New Question"
    
    fill_in "Question", with: "" 
    
    click_button "Ask question"

    expect(page).to have_content("Question not asked") 
    expect(page).to have_content("Question can't be blank") 
  end
  
end