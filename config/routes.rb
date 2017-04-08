Rails.application.routes.draw do
 
  get 'topusers/index'

  get 'topdares/index'

  resources :votes
  resources :userdares
  resources :comments
  get '/comments/list/:id' => 'comments#list'
  
  get 'welcome/index'

  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  	get  '/help',    to: 'static_pages#help', as: 'help'
  	get  '/about', to: 'static_pages#about', as: 'about'
  	get '/contact', to: 'static_pages#contact', as: 'contact'
 	
 	#root to welcome home if logged in
 	authenticated :user do
    	root 'welcome#index', as: :authenticated_root
  	end
 	root 'static_pages#home' #root to static home if not logged in
end
