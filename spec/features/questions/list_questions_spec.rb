require 'rails_helper'

RSpec.feature 'List questions' do 

  before do

    @question1 = FactoryGirl.create(:question)
    @question2 = FactoryGirl.create(:question)

  end

  scenario "A user should see questions" do

    visit root_path

    expect(page).to have_content(@question1.question)
    expect(page).to have_content(@question2.question)
    expect(page).to have_link(@question1.question)
    expect(page).to have_link(@question2.question)

 end

 scenario "A user should not see questions" do
    Question.delete_all

    visit root_path

    expect(page).not_to have_content(@question1.question)
    expect(page).not_to have_content(@question2.question)
    expect(page).not_to have_link(@question1.question)
    expect(page).not_to have_link(@question2.question)

    expect(page).to have_content("No Questions... please add")

 end

end