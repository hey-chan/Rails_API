require "rails_helper"

RSpec.describe "Categories", type: :request do
  describe "GET /index" do
    before(:all) do
      create(:category)
    end

    before(:each) do
      get "/categories"
    end

    # TESTING OUT response
    it "should respond with 200 ok" do
      expect(response).to have_http_status(200)
    end

    # CHECKING JSON response
    it "should respond with JSON" do
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    # RESPONDING to set factory category
    it "should correspond to the correct category" do
      expect(response.body).to include("community")
    end
  end
end
