RSpec.feature 'Question' do 

  before do
    @user = FactoryGirl.create(:user)
    login_as(@user)

    @question = FactoryGirl.create(:question, user: @user )

  end

  scenario 'A user can see a question' do
    visit root_path

    click_link @question.question

    expect(page).to have_content(@question.question)
    expect(current_path).to eq(question_path(@question))

  end

end