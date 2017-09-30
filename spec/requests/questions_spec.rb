RSpec.describe "Questions", type: :request do
  before do
    @question = FactoryGirl.create(:question)
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
end