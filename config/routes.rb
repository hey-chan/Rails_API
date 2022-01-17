Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  ### SHOW all categories
  get "/categories", to: "categories#index", as: "categories"

  ### SHOW all features
  get "/features", to: "features#index", as: "features"

  ### SHOW all addresses
  get "/addresses", to: "addresses#index", as: "addresses"

  ### PARKS stuff
  get "/parks", to: "parks#index", as: "parks"

  # Displays one park based on park.id
  get "/parks/:id", to: "parks#show", as: "park"

  # POST a park (this will be restricted to ONLY admin)
  post "/parks/new", to: "parks#create"

  # UPDATE a park (again restricted to admin)
  put "/parks/:id", to: "parks#update"
  patch "/parks/:id", to: "parks#update"

  # DELETE a park (restricted to admin)
  delete "/parks/:id", to: "parks#destroy"

  ### Comments connected to each part
  get "/parks/:park_id/comments", to: "posts#index", as: "reviews"

  ### DISPLAYS a single comment
  get "/parks/comments/:id", to: "posts#show", as: "review"

  # CREATE a comment for a park
  post "/parks/:park_id/comments", to: "posts#create"

  # UPDATE a comment for park
  put "/parks/comments/:id", to: "posts#update"
  patch "/parks/comments/:id", to: "posts#update"

  # DELETE a comment for park
  delete "/parks/comments/:id", to: "posts#destroy"

  ### Authentication routing
  # Login with a user
  post "/auth/signin", to: "auth#signin", as: "signin"
  # Register a user
  post "/auth/signup", to: "auth#signup", as: "signup"

  # Persisten data
  post "/auth/signed_in_user", to: "auth#signed_in_user"
end
