require 'rails_helper'

RSpec.describe "Demopages", type: :request do

  describe "GET /home" do
    it "returns http success" do
      get "/demopages/home"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /sign_up" do
    it "returns http success" do
      get "/demopages/sign_up"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /country_search" do
    it "returns http success" do
      get "/demopages/country_search"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /country_page" do
    it "returns http success" do
      get "/demopages/country_page"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /admin_dash" do
    it "returns http success" do
      get "/demopages/admin_dash"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /country_index" do
    it "returns http success" do
      get "/demopages/country_index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /country_page_editor" do
    it "returns http success" do
      get "/demopages/country_page_editor"
      expect(response).to have_http_status(:success)
    end
  end

end
