Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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
