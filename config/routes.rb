Rails.application.routes.draw do

	resources :doctors, only: [:index]
	resources :surgeries, only: [:show, :update, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
