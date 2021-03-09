Rails.application.routes.draw do

	resources :doctors, only: [:index]
	resources :surgeries, only: [:show, :index]
	resources :doctor_surgeries, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
