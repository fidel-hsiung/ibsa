Rails.application.routes.draw do
	
  root    'pages#home'

  get     'login',      to: 'sessions#new'
  post    'sessions',   to: 'sessions#create'
  delete  'logout',     to: 'sessions#destroy'
  
  resources :users, except: [:show]
  resources :goods, except: [:show] do
  	collection do
  		get  :bulk_new
  		post :bulk_create
  	end
  end
end
