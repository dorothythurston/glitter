Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :items, only: [:create, :show, :destroy]
  root to: "dashboards#show"

  get '/sign_in' => 'sessions#new', as: 'sign_in'
end
