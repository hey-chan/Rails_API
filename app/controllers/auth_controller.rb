class AuthController < ApplicationController
  # TO LOGIN with a user
  def signin
    user = User.signin(auth_params[:signin]).first
    if user&.authenticate(auth_params[:password])
      token = JwtServices.encode(user)
      # USEFUL for React
      render json: { jwt: token, username: user.username }
    else
      # If email or password are incorrect
      render json: { error: "Your password or email is incorrect" }, status: 422
    end
  end

  # SIGN UP and create user
  def signup
    # Creates a user
    user = User.create(auth_params)
    # If no errors present, user will be created
    unless user.errors.any?
      token = JwtServices.encode(user)
      render json: { jwt: token, username: user.username }, status: 201
    else
      # If there are errors, error message will render
      render json: { error: user.errors.full_messages }, status: 422
    end
  end

  private

  def auth_params
    # ALLOWED parameters
    params.require(:auth).permit(:auth, :signin, :email, :password, :password_confirmation, :username)
  end
end
