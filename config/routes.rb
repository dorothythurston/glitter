Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  root to: "dashboards#show"

  get '/sign_in' => 'sessions#new', as: 'sign_in'

  resources :users, only: [:new, :create, :show] do
    member do
      post "follow" => "following_relationships#create"
      delete "unfollow" => "following_relationships#destroy"
    end
  end

  resources :items, only: [:create, :show, :destroy] do
    member do
      post "glitter" => "item_glitterings#create"
    end
  end

  scope module: :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :items, only: [:index, :create]
      resource :session
    end
  end
end
