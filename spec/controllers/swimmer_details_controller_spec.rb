require 'rails_helper'

RSpec.describe SwimmerDetailsController, type: :controller do
  let(:swimmer) { create(:swimmer_detail) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:sucess)
    end
  end
end
