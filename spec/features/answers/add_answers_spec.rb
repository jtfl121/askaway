RSpec.feature 'Add answers to questions' do 

  before do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    @question = FactoryGirl.create(:question, user: @user)

  end

  scenario 'allow signed in user to answer' do
    login_as(@user2)

    visit root_path

    click_link @question.question

    fill_in :answer, with: "This is my answer"

    click_link "Post your Answer"
    
    expect(page).to have_content("Your question was added")
    expect(page).to have_content("This is my answer")
    expect(page).to have_content("Answered by: #{@user2}")
    expect(current_path).to eq(quesiton_path(@question.id))

  end

end