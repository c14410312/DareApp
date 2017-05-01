require 'sidekiq/web'
Rails.application.routes.draw do
 
  match '/users', to: 'users#index', via: 'get'
  match '/users/:id', to: 'users#show', via: 'get'
  match :find_friends, to: 'home#find_friends', as: :find_friends, via: :get

  get 'topusers/index'

  get 'topdares/index'

  resources :votes
  resources :userdares
  resources :comments
  resources :videos
  get '/comments/list/:id' => 'comments#list'

  resources :dare_rooms, only: [ :new, :create, :show, :index, :set_user, :update]
  get 'dare_rooms/index'
  get "/set_to_accepted" => 'dare_rooms#set_to_accepted', as: 'set_to_accepted'
  get "/set_to_declined" => 'dare_rooms#set_to_declined', as: 'set_to_declined'
  get "/set_to_approved" => 'dare_rooms#set_to_approved', as: 'set_to_approved'
  get "/set_to_unapproved" => 'dare_rooms#set_to_unapproved', as: 'set_to_unapproved'
  get "/set_to_public" => 'dare_rooms#set_to_public', as: 'set_to_public'
  get "/set_to_private" => 'dare_rooms#set_to_private', as: 'set_to_private'
  

  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  resources :users, :only =>[:show]	
  get  '/help',    to: 'static_pages#help', as: 'help'
	get  '/about', to: 'static_pages#about', as: 'about'
	get '/contact', to: 'static_pages#contact', as: 'contact'
 	
 	#root to welcome home if logged in
 	authenticated :user do
    	root 'home#index', as: :authenticated_root
  	end
 	root 'static_pages#home' #root to static home if not logged in

  mount Sidekiq::Web => '/sidekiq'
end
