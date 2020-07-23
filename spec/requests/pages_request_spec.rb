require 'rails_helper'

RSpec.describe "Pages", type: :request do

  describe "GET /more" do
    it "returns http success" do
      get "/pages/more"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /notifications" do
    it "returns http success" do
      get "/pages/notifications"
      expect(response).to have_http_status(:success)
    end
  end

end
