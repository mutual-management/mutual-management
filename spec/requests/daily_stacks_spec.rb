require 'rails_helper'

RSpec.describe "DailyStacks", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/daily_stacks/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/daily_stacks/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/daily_stacks/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/daily_stacks/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/daily_stacks/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
