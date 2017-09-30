require 'rails_helper'

RSpec.feature 'List questions' do 

  before do
    @question1 = FactoryGirl.create(:question)
    @question2 = FactoryGirl.create(:question)

  end

  scenario "A user should see top 10 questions" do

    visit root_path

    expect(page).to have_content(@question1.question)
    expect(page).to have_content(@question2.question)
    expect(page).to have_link(@question1.question)
    expect(page).to have_link(@question2.question)

 end

end