RSpec.feature 'Add tags to questions' do 

  before do
    @user = FactoryGirl.create(:user)
    @question = FactoryGirl.create(:question, user: @user, tag_list:"tag1")

  end

  scenario 'allow user to add tags to question' do
    login_as(@user)

    visit root_path

    click_link "New Question"

    fill_in "Question", with: "This is my question"
    fill_in "question_tag_list", with: "tag 1"

    click_button "Ask question"

    expect(Question.last.user).to eq(@user)
    expect(page).to have_content("New question asked")
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content("Asked by: #{@user.email}")
    expect(page).to have_content("tag 1")
  end


  scenario 'allow add tags to be seen on index- not logged in' do

    visit root_path

    expect(page).to have_content(@question.question)
    expect(page).to have_content("Asked by: #{@user.email}")
    expect(page).to have_content(@question.tag_list)


  end

end