Rails.application.routes.draw do

	resources :doctor, only: [:index]
	resources :surgery, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
