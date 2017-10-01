RSpec.feature 'Add answers to questions' do 

  before do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    @question = FactoryGirl.create(:question, user: @user)
    @answer = FactoryGirl.create(:answer, question: @question, user: @user2)

  end

  scenario 'allow signed in user to answer' do
    login_as(@user2)

    visit root_path

    click_link @question.question

    fill_in "Answer", with: "This is my answer"

    click_button "Post your answer"
    
    expect(page).to have_content("Your question was added")
    expect(page).to have_content("This is my answer")
    expect(page).to have_content("Answered by: #{@user2.email}")
    expect(current_path).to eq(question_path(@question.id))

  end

end