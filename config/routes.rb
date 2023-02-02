Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/posts", to: "posts#index"
  get "/authors/:author_id/posts", to: "posts#index"
  get "/authors", to: "authors#index"
  get "/authors/:id", to: "authors#show"
  post "/authors/:author_id/posts", to: "posts#create"
  post "/posts", to: "posts#create"
end
