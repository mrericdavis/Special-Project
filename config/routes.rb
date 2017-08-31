Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get  '/images' => 'images#index'
      get  '/images/:id' => 'images#show'
      post '/images' => 'images#create' 
      get "/comments" => "comments#index"
      get "/comments" => "comments#show"
      post "/comments" => "comments#create"
    end
  end

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

  get "/friends" => "users#friend"
  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
end
