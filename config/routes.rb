Rails.application.routes.draw do
  
  devise_for :users
  root "restaurants#index"

  resources :restaurants do
  	resources :orderlists, only: [:index, :new, :create]
  	member do
  		get :order
  	end
  end
 
  resources :orderlists

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
