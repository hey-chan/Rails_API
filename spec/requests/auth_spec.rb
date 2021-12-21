require "rails_helper"

RSpec.describe "Auths", type: :request do
  describe "POST /index/login" do
    before(:all) do
      @user = create(:user)
    end

    context "with the right authorisation credentials" do
      before(:each) do
        post "/auth/login", params: { auth: { email: "test@picvic.com.au", password: "password1" } }
      end

      it "should return 200 ok" do
        expect(response).to have_http_status(200)
      end

      it "should include a username and JWT" do
        expect(response.body).to include("jwt")
        expect(response.body).to include("tester")
      end
    end

    context "with the wrong authorisation credentials" do
      before(:each) do
        post "/auth/login", params: { auth: { email: "test@picvic.com.au", password: "wrongPassword" } }
      end

      it "should return 422 error code" do
        expect(response).to have_http_status(422)
      end

      it "should include an error message" do
        expect(response.body).to include("Your password or email is incorrect")
      end
    end
  end
end
