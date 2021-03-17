Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root to: 'tweets#index'
  resources :tweets, only: [:index, :new, :show, :create] do
    collection do 
      get 'search'
    end
    resources :comments, only: [:create]
  end
end
