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

  # POST a park (this will be restricted to ONLY admin)
  post "/parks", to: "parks#create"

  ### Comments connected to each part
  # Nb. Needs to be worked on more
  # Issue: connecting comments associated with the param id
  # get "/parks/:id/comments", to: "posts#show", as: "comment"
  ### TESTING: STILL WORKING PROGRESS
  get "/parks/:id/comments", to: "posts#index", as: "reviews"

  #

  ### Authentication routing
  # Login with a user
  post "/auth/signin", to: "auth#signin", as: "signin"
  # Register a user
  post "/auth/signup", to: "auth#signup", as: "signup"
end
