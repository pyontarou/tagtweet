Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root to: 'tweets#index'
  resources :tweets, only: [:index, :new, :show, :create, :destroy] do
    collection do 
      get 'look'
    end
    collection do 
      get 'search'
    end
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]

  end
end
