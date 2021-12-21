require "rails_helper"

RSpec.describe "Auths", type: :request do
  describe "POST /auth/signin" do
    before(:all) do
      @user = create(:user)
    end

    context "with the right authentication credentials" do
      before(:each) do
        post "/auth/signin", params: { auth: { signin: "test@picvic.com.au", password: "password1" } }
      end

      it "should return 200 ok" do
        expect(response).to have_http_status(200)
      end

      it "should include a username and JWT" do
        expect(response.body).to include("jwt")
        expect(response.body).to include("tester")
      end
    end

    context "with the wrong authentication credentials" do
      before(:each) do
        post "/auth/signin", params: { auth: { signin: "test@picvic.com.au", password: "wrongPassword" } }
      end

      it "should return 422 error code" do
        expect(response).to have_http_status(422)
      end

      it "should include an error message" do
        expect(response.body).to include("Your password or email is incorrect")
      end
    end
  end

  describe "POST /auth/signup" do
    context "with valid details" do
      before(:all) do
        # Will check how many users are present in database
        @user_count = User.count
      end

      before(:each) do
        post "/auth/signup", params: { auth: { email: "test1@test.com", username: "a-new-user", password: "password1", password_confirmation: "password1" } }
      end

      it "should return 201 okay code" do
        pp request
        expect(response).to have_http_status(201)
      end

      it "should include a username and a JWT" do
        expect(response.body).to include("jwt")
        expect(response.body).to include("a-new-user")
      end

      it "should increase user count present in the database" do
        expect(User.count).to eq(@user_count + 1)
      end
    end
  end
end
