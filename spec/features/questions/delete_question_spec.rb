require 'rails_helper'

RSpec.feature 'Delete question' do

  before do
    @question = FactoryGirl.create(:question)
  end

  scenario 'A user deletes a question' do
    visit root_path

    click_link @question.question
    click_link 'Delete question'

    expect(page).to have_content("Question was deleted")
    expect(current_path).to eq(root_path)

  end
end
