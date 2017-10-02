RSpec.feature 'Question' do 

  before do
    @user = FactoryGirl.create(:user)
    login_as(@user)

    @question = FactoryGirl.create(:question, user: @user )

  end

  scenario 'A user edits a question' do
    visit root_path

    click_link @question.question
    click_link 'Edit question'

    fill_in "Question", with: "update question"

    click_button "Update question"

    expect(page).to have_content("Question was updated")
    expect(current_path).to eq(question_path(@question))

  end

  scenario 'A user fails to edit a question' do
    visit root_path

    click_link @question.question
    click_link 'Edit question'

    fill_in "Question", with: ""

    click_button "Update question"

    expect(page).to have_content("Question was not updated") 
    expect(current_path).to eq(question_path(@question))

  end

end