Rails.application.routes.draw do
  
  devise_for :users
  root "orders#index"

  resources :restaurants
 
  resources :orderlists
  resources :orders do 
  	resources :orderlists, only: [:index, :new, :create]
  	member do 
  		get :closed
      get :history
  	end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
