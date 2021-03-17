Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets, only: [:index, :new, :show, :create] do
    collection do 
      get 'search'
    end
  end
end
