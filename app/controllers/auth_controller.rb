class AuthController < ApplicationController
  def login
    user = User.find_by(email: auth_params[:email])
    if user&.authenticate(auth_params[:password])
      payload = { user_id: user.id, exp: 1.hour.from_now.to_i }
      # RESPONSIBLE for creating web token
      token = JWT.encode(payload, Rails.application.credentials.dig(:secret_key_base))
      # USEFUL for React
      render json: { jwt: token, username: user.username }
    else
      # If email or password are incorrect
      render json: { error: "Your password or email is incorrect" }, status: 422
    end
  end

  private

  def auth_params
    # ALLOWED parameters
    params.require(:auth).permit(:auth, :email, :password, :password_confirmation, :username)
  end
end
