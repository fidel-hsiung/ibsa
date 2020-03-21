Rails.application.routes.draw do
	
  root 'pages#home'
  
  resources :users

  get     'login',      to: 'sessions#new'
  post    'sessions',   to: 'sessions#create'
  delete  'logout',     to: 'sessions#destroy'
end
