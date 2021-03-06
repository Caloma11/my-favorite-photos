Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :artists, only: [:show, :create]

  resources :favorites, only: [:create, :destroy]

  get "dashboard", to: "pages#dashboard", as: :dashboard
  get "top_10", to: "pages#top", as: :top

end
