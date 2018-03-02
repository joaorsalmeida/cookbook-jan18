Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :recipes do
    collection do
      get 'search'
    end
    member do
      get 'preview'
      post 'favorite'
    end
  end
  resources :cuisines, only: [:show, :new, :create]
end
