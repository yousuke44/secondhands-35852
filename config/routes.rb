Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    collection do
      get 'search'
    end
  end
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
  end
end
