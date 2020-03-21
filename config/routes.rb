Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'pages#home'
  
  resources :users

  get     'login',      to: 'sessions#new'
  post    'sessions',   to: 'sessions#create'
  delete  'logout',     to: 'sessions#destroy'
end
