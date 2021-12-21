Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  ### SHOW all categories
  get "/categories", to: "categories#index", as: "categories"

  ### SHOW all features
  get "/features", to: "features#index", as: "features"

  ### PARKS stuff
  get "/parks", to: "parks#index", as: "parks"
  # Displays one park based on park.id
  get "/parks/:id", to: "parks#show", as: "park"

  ### Comments connected to each part
  # Nb. Needs to be worked on more
  # Issue: connecting comments associated with the param id
  get "/parks/:id/comments", to: "posts#show", as: "comment"

  ### Authentication routing
  # Login with a user
  post "/auth/signin", to: "auth#signin", as: "signin"
  # Register a user
  post "/auth/signup", to: "auth#signup", as: "signup"
end
