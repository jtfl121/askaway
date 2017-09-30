require 'rails_helper'

RSpec.feature 'List questions' do 

  before do
    @question1 = Question.create(question: "Change the style of the block depending on the data in the data?")
    @question2 = Question.create(question: "What is wrong with my link_to tag? NameError. undefined local variable or method")

  end

  scenario "A user should see top 10 questions" do

    visit root_path

    expect(page).to have_content(@question1.question)
    expect(page).to have_content(@question2.question)
    expect(page).to have_link(@question1.question)
    expect(page).to have_link(@question2.question)

 end

end