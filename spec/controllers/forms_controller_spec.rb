require 'rails_helper'

RSpec.describe FormsController, type: :controller do
  let(:my_form) { create(:form) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
