Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :recipes, only: [ :index, :show, :new, :edit ] do
    resources :reviews, only: :create
  end
end
