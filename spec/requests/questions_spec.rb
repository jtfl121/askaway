RSpec.describe "Questions", type: :request do
  before do

    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    # login_as(@user)

    @question = FactoryGirl.create(:question, user: @user )
  end

  describe 'GET /questions/:id' do 
    context 'with existing question' do
      before { get "/questions/#{@question.id}" }
      
      it "handles existing question" do 
        expect(response.status).to eq 200
      end 
    end

    context 'with non-existing question' do 
      before { get "/questions/xxxxx" }
      it "handles non-existing question" do 

        expect(response.status).to eq 302
        flash_message = "The question you are looking for could not be found"
        expect(flash[:alert]).to eq flash_message
      end 
    end
  end 

  describe 'GET /questions/:id/edit' do 

    context 'with non-signed in user' do
      before { get "/questions/#{@question.id}/edit" }
      
      it "redirects to the signin page" do 
        expect(response.status).to eq 302
        flash_message = "You need to sign in or sign up before continuing."
        expect(flash[:alert]).to eq flash_message
      end 
    end

    context 'with logged in non-owners' do 
      before do
        login_as(@user2)
        get "/questions/#{@question.id}/edit" 
      end
      
      it "redirects to the home page" do 
        expect(response.status).to eq 302
        flash_message = "You can only edit your own question." 
        expect(flash[:alert]).to eq flash_message
      end 
    end
  end

  # describe 'DELETE /questions/:id' do
  #   context 'logged in and owner' do 
  #     before do
  #       login_as(@user)
  #       delete "/questions/#{@question.id}" 
  #     end
      
  #     it "should return with 200" do 
  #       expect(response.status).to eq 200
  #       flash_message = "Question was deleted." 
  #       expect(flash[:alert]).to eq flash_message
  #     end 
  #   end

    # context 'logged in and non-owner' do 
    #   before do
    #     login_as(@user2)
    #     delete "/questions/#{@question.id}" 
    #   end
      
    #   it "Question was deleted" do 
    #     expect(response.status).to eq 302
    #     flash_message = "You can only delete your own question." 
    #     expect(flash[:alert]).to eq flash_message
    #   end 
    # end
  # end
end