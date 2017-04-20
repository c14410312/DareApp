Rails.application.routes.draw do
 
  match '/users', to: 'users#index', via: 'get'
  match '/users/:id', to: 'users#show', via: 'get'
  match :find_friends, to: 'home#find_friends', as: :find_friends, via: :get

  get 'topusers/index'

  get 'topdares/index'

  resources :votes
  resources :userdares
  resources :comments
  get '/comments/list/:id' => 'comments#list'

  resources :dare_rooms, only: [ :new, :create, :show, :index, :set_user]
  get 'dare_rooms/index'
  get "/set_to_accepted" => 'dare_rooms#set_to_accepted', as: 'set_to_accepted'
  get "/set_to_declined" => 'dare_rooms#set_to_declined', as: 'set_to_declined'
  

  devise_for :users, class_name: 'FormUser', :path_prefix => 'd', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  resources :users, :only =>[:show]	
  get  '/help',    to: 'static_pages#help', as: 'help'
	get  '/about', to: 'static_pages#about', as: 'about'
	get '/contact', to: 'static_pages#contact', as: 'contact'
 	
 	#root to welcome home if logged in
 	authenticated :user do
    	root 'home#index', as: :authenticated_root
  	end
 	root 'static_pages#home' #root to static home if not logged in
end
