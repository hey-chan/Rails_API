require "rails_helper"

RSpec.describe "Parks", type: :request do
  before(:all) do
    build(:park)
  end

  before(:all) do
    @address = create(:address, number: 10, street: "Main Street", suburb: "Main town", postcode: "1234")
    @category = create(:category, name: "test category")
    @feature = create(:feature, name: "test feature")
    @user = create(:user, username: "admin", email: "admin@test.com", password: "test", password_confirmation: "test", admin: true)
    create(:park, name: "Test park", address_id: @address.id, category_id: @category.id, feature_id: @feature.id, user_id: @user.id, latitude: 123.123, longitude: 123.123)
  end

  describe "GET /parks" do
    before(:each) do
      get "/parks"
    end

    it "should respond with 200 ok" do
      expect(response).to have_http_status(200)
    end

    it "should respond with json" do
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  describe "GET /parks/:id" do
    context "valid park id" do
      before(:each) do
        get "/parks/1"
      end

      # TEST failing despite manual testing (via REST Client) working accordingly to plan
      it "should respond with 200 ok" do
        expect(response).to have_http_status(200)
      end

      it "should respond with json" do
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end

      # it "should respond with the included category" do
      #   expect(response.body).to include("community")
      # end

      # it "has the right name" do
      #   expect(response.name).to eq("Flagstaff Gardens")
      # end
    end

    context "invalid park id" do
      before(:each) do
        get "/parks/100"
      end

      it "should respond with 404 error code" do
        expect(response).to have_http_status(404)
      end

      it "should respond with json" do
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end

      it "should respond with an error" do
        expect(response.body).to include("Could not find this park")
      end
    end
  end
end
