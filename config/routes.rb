Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :items, only: [:create, :show]
  root to: "dashboards#show"

  get '/sign_in' => 'sessions#new', as: 'sign_in'
end