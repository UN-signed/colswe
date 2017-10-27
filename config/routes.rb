Rails.application.routes.draw do
  root to: 'home#index'
  resources :home
  get "home/index"

  resources :contacts
	resources :subscribers
  resources :tags
  resources :research_areas
  resources :research_lines
  resources :members
  resources :research_groups
  resources :articles
  resources :projects

  resources :research_groups do
    resources :projects
  end

  resources :research_groups do
    resources :members
  end

	## devise controllers for users
	devise_for :user, controllers: {
	  confirmations: 'users/confirmations',
	  passwords: 'users/passwords',
	  registrations: 'users/registrations',
	  sessions: 'users/sessions',
	  # unlocks: 'users/unlocks',

    :omniauth_callbacks => "users/omniauth_callbacks",
	}, skip: [:sessions]

	## custom routes for users
	as :user do
	  get 'login' => 'users/sessions#new', as: :new_user_session
	  post 'login' => 'users/sessions#create', as: :user_session
		delete 'logout' => 'users/sessions#destroy', as: :destroy_user_session
		get 'register' => 'users/registrations#new'
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
