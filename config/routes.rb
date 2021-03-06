Rails.application.routes.draw do
  resources :messages
  root to: 'home#index'
  resources :home
  get "home/index"

  get '/contact', to: 'home#contact'
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

  # resources :projects do
  #   resources :articles
  # end

  ## articles controller methods
  get 'articles/new/upload_url' => 'articles#upload_url', as: 'upload_url'
  get 'users/users/:id/show_message/:md' => 'users/users#show_message', as: 'show_message'

  post 'projects/:id/add_subscriber' => 'subscribers#add_subscriber', as: 'add_subscriber'
  delete 'projects/:id/add_subscriber' => 'subscribers#delete_subscriber', as: 'delete_subscriber'

	## devise controllers for users
	devise_for :user, controllers: {
	  confirmations: 'users/confirmations',
	  passwords: 'users/passwords',
	  registrations: 'users/registrations',
	  sessions: 'users/sessions',
	  # unlocks: 'users/unlocks',

    :omniauth_callbacks => "users/omniauth_callbacks",
    users: 'users/users',
	}, skip: [:sessions]

	## custom routes for users
  get 'users/:id' => 'users/users#show', as: :user_profile
	as :user do
	  get 'login' => 'users/sessions#new', as: :new_user_session
	  post 'login' => 'users/sessions#create', as: :user_session
		delete 'logout' => 'users/sessions#destroy', as: :destroy_user_session
		get 'register' => 'users/registrations#new'
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
