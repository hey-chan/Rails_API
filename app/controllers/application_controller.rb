class ApplicationController < ActionController::API
  # We will need this repeated functionlaity.
  def authenticate
    token = extract_token_from_auth_headers
    payload = JwtServices.decode(token)

    # PAYLOAD: user_id
    if payload
      @current_user ||= User.find(payload["user_id"])
    else
      render json: { error: "You must be logged in" }, status: 401
    end
  end

  def current_user
    @current_user
  end

  def logged_in?
    !!@current_user
    # BOOLEAN. True or false if logged in
  end

  def extract_token_from_auth_headers
    # If auth header exist, we will get header,split it out and extract second part
    # If not, we can't call the split and array method
    request.headers["Authorization"]&.split(" ")&.last
  end
end
