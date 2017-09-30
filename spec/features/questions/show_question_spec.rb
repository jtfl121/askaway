require 'rails_helper'

RSpec.feature 'Question' do 

  before do

    @question = FactoryGirl.create(:question)

  end

  scenario 'A user can see a question' do
    visit root_path

    click_link @question.question

    expect(page).to have_content(@question.question)
    expect(current_path).to eq(question_path(@question))

  end

end