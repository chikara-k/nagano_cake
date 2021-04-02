Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
	  sessions:      'admins/sessions',
	  passwords:     'admins/passwords',
	  registrations: 'admins/registrations'
	}
	
	devise_scope :admins do
		get 'admins/sign_in' => 'admins/sessions#create'
		get 'admins/sign_out' => 'admins/sessions#destroy'
	end
	
	
	devise_for :customers, controllers: {
  	sessions:      'customers/sessions',
  	passwords:     'customers/passwords',
  	registrations: 'customers/registrations'
	}
	
	devise_scope :customers do
		get 'customers/sign_in' => 'customers/sessions#create'
		get 'customers/sign_out' => 'customers/sessions#destroy'
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get '/about' => 'homes#about'
  
    resources :customers, only: [:show, :edit, :update] do
      member do
        get "confirm"
        #ユーザーの会員状況を取得
        patch "hide"
        #ユーザーの会員状況を更新
      end
    end

    resources :cart_items, only: [:index, :update, :destroy] do
      collection do
        delete 'empty'
      end
    end

    resources :items, only: [:index, :show, :create] do
     resources :cart_items, only: [:create]
    end
    
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only: [:new, :create, :index, :show]

    resources :addresses, only: [:index, :create, :destroy, :edit, :update]
    
    namespace :admins do
      root to: 'homes#top'
      resources :items
      resources :genres, only: [:index, :create, :edit, :update]
      resources :customers, only: [:index, :show, :edit, :update]
      resources :orders, only: [:index, :show, :update] do
        resources :order_items, only: [:update]
      end
    end

  end
