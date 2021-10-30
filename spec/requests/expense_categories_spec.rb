require 'rails_helper'

RSpec.describe "ExpenseCategories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/expense_categories/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/expense_categories/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/expense_categories/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
