Rails.application.routes.draw do
   
  namespace :site do
    get 'welcome/index'
    
  end
  namespace :users_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index' # Dashboard
    resources :admins# Administradores
    resources :subjects
    resources :questions
  end
  
  

  devise_for :admins
  

  
  devise_scope :admin do  
    get '/admins/sign_out' => 'devise/sessions#destroy'      
    
  end


  devise_for :users
  
 
  get 'inicio', to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'site/welcome#index'

end
