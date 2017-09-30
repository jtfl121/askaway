RSpec.describe "Questions", type: :request do


  describe 'GET /questions/:id' do 
    context 'with non-existing route' do
      before { get "/#{Faker::Lorem.word}" }
      
      it "handles existing question" do 
        expect(response.status).to eq 302
        flash_message = "The route you are looking for could not be found"
        expect(flash[:alert]).to eq flash_message
      end 
    end 
  end
end