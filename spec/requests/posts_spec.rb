require "rails_helper"

RSpec.describe "Posts", type: :request do
  before(:all) do
    build(:post)
  end

  describe "POST /posts" do
    before(:all) do
      @post_count = Post.count
      @new_user = create(:user, email: "test@test.com", username: "test")
      @address = create(:address, number: 10, street: "Main Street", suburb: "Main town", postcode: "1234")
      @category = create(:category, name: "test category")
      @feature = create(:feature, name: "test feature")
      @park = create(:park, name: "Test park", address_id: @address.id, category_id: @category.id, feature_id: @feature.id, latitude: 123.123, longitude: 123.123)
    end

    context "with token" do
      before(:each) do
        token = JwtServices.encode(@new_user)
        post "/parks/1/comments", headers: { Authorization: "Bearer #{token}" }, params: { post: { user_id: 1, comment: "This is an average park", rating: 5, park_id: @park.id } }
      end

      it "should respond with 201 created" do
        expect(response).to have_http_status(201)
      end

      it "should increase post count by 1" do
        expect(Post.count).to be @post_count + 1
      end

      it "should contain post comment" do
        expect(response.body).to include("This is an average park")
      end
    end

    context "without token" do
      before(:each) do
        post "/parks/1/comments", params: { post: { user_id: 1, comment: "This is an average park", rating: 5, park_id: 1 } }
      end

      it "should respond with 401" do
        expect(response).to have_http_status(401)
      end

      it "should not increase post count by 1" do
        expect(Post.count).to be @post_count
      end

      it "should contain message" do
        expect(response.body).to include("You must be logged in")
      end
    end
  end
end
