Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  root to: "homes#show"

  get '/sign_in' => 'sessions#new', as: 'sign_in'

  resource :dashboard, only: [:show]

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
      resources :users, only: [:create, :show]
      resources :items, only: [:index, :create, :destroy, :show] do
        member do
          post "glitter" => "item_glitterings#create"
        end
      end
      resources :activities, only: [:index]
      resource :session
    end
  end
end
