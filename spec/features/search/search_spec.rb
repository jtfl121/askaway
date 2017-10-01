RSpec.feature 'Search' do

  before do

    @user = FactoryGirl.create(:user)

    @question = FactoryGirl.create(:question, user: @user, tag_list:"tag1")
    @question2 = FactoryGirl.create(:question, user: @user, tag_list:"tag2")
    @question3 = FactoryGirl.create(:question, user: @user, tag_list:"tag1, tag3")
    @question4 = FactoryGirl.create(:question, user: @user, tag_list:"tag1")


  end

  scenario 'A user can search for questions' do
    visit root_path

    fill_in "Search", with: @question.question

    expect(page).to have_content(@question.question)
    expect(page).not_to have_content(@question2.question)
    expect(page).not_to have_content(@question3.question)
    expect(page).not_to have_content(@question4.question)

  end


end
