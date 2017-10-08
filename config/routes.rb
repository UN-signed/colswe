Rails.application.routes.draw do
  resources :contacts
	resources :subscribers
    resources :tags
    resources :research_areas
    resources :research_lines
    resources :projects
    resources :members
    resources :research_groups
	resources :articles
	resources :projects

	root to: 'home#index'
	resources :home
    get "home/index"

    #get 'welcome/index'

	## devise controllers for users
	devise_for :user, controllers: {
	  confirmations: 'users/confirmations',
	  passwords: 'users/passwords',
	  registrations: 'users/registrations',
	  sessions: 'users/sessions',
	  # unlocks: 'users/unlocks',
	}, skip: [:sessions]

	## custom routes for users
	as :user do
	    get 'login' => 'users/sessions#new', as: :new_user_session
	    post 'login' => 'users/sessions#create', as: :user_session
		delete 'logout' => 'users/sessions#destroy', as: :destroy_user_session
		get 'register' => 'users/registrations#new'
	end

	# get "/articles"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
