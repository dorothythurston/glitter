Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :items, only: [:create, :show, :destroy]
  root to: "dashboards#show"

  get '/sign_in' => 'sessions#new', as: 'sign_in'

  resources :users, only: [:new, :create, :show] do
    member do
      post "follow" => "following_relationships#create"
      delete "unfollow" => "following_relationships#destroy"
    end
  end
end
