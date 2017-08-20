Rails.application.routes.draw do

  get "/" => "users#home"
  
  get "/users" => "users#index"
  get "/users/new" => "users#new"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  get "/users/:id/edit" => "users#edit"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  get "/images" => "images#index"
  get "/images/new" => "images#new"
  post "/images" => "images#create"
  get "/images/:id" => "images#show"
  get "/images/:id/edit" => "images#edit"
  patch "/images/:id" => "images#update"
  delete "/images/:id" => "images#destroy"

  post "/comments" => "comments#create"

  post "/relationships" => "relationships#create"

  
  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
end
