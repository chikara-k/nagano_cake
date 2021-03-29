Rails.application.routes.draw do
  
  devise_for :customers
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admins do
  end
  root to: 'homes#top'
  get '/about' => 'homes#about'
  
  get 'items/index'
  get 'items/show'
  
end
