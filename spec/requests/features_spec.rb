require "rails_helper"

RSpec.describe "Features", type: :request do
  describe "GET /index" do
    before(:all) do
      create(:feature)
    end

    before(:each) do
      get "/features"
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
    it "should correspond to the correct feature" do
      expect(response.body).to include("all")
    end
  end
end
