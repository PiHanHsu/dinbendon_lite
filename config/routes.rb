Rails.application.routes.draw do
  
  root "orders#index"

  devise_for :users

  resources :restaurants 
  resources :orderlists
  resources :orders do 
  	resources :orderlists, only: [:index, :new, :create]
  	member do 
  		get :closed
      get :history
  	end
  end

  namespace :admin do
    resources :restaurants
    resources :orders do
      collection do 
        get :overview
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
