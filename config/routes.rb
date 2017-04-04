Rails.application.routes.draw do
 
  devise_for :users
    root 'static_pages#home'
  	get  '/help',    to: 'static_pages#help', as: 'help'
  	get  '/about', to: 'static_pages#about', as: 'about'
  	get '/contact', to: 'static_pages#contact', as: 'contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
