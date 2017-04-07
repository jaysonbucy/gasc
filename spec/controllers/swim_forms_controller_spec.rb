require 'rails_helper'

RSpec.describe SwimFormsController, type: :controller do
  let(:my_swim_form) { create(:swim_form) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
