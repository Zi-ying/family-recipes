Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :recipes, only: [ :index, :show, :new, :edit, :destroy ] do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]
end
