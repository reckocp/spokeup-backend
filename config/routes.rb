Rails.application.routes.draw do
resources :cities
resources :neighborhoods
resources :users
resources :votes


  namespace :api do
    resources :cities
    resources :neighborhoods
    resources :users
    resources :votes
  end
end
