Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:show, :update]
  resources :items do
    collection do
      get 'search'
    end
  end
  resources :items do
    resources :orders, only: [:index, :create]
  end
end
