RSpec.feature 'Question' do 

  before do
    @user = FactoryGirl.create(:user)
    @user2  = FactoryGirl.create(:user)

    @question = FactoryGirl.create(:question, user: @user )

  end

  scenario 'A user not logged in cant see edit/del question' do
    visit root_path

    click_link @question.question

    expect(page).to have_content(@question.question)
    expect(current_path).to eq(question_path(@question))

    expect(page).not_to have_link("Edit question")
    expect(page).not_to have_link("Delete question")
  end


  scenario 'A user logged in but not owner cant see edit/del question' do
    login_as(@user2)
    visit root_path

    click_link @question.question

    expect(page).to have_content(@question.question)
    expect(current_path).to eq(question_path(@question))

    expect(page).not_to have_link("Edit question")
    expect(page).not_to have_link("Delete question")
  end

  scenario 'A user logged in and owner can see edit/del question' do
    login_as(@user)

    visit root_path

    click_link @question.question

    expect(page).to have_content(@question.question)
    expect(current_path).to eq(question_path(@question))

    expect(page).to have_link("Edit question")
    expect(page).to have_link("Delete question")
  end

end