Rails.application.routes.draw do
  # get 'feedback/new'
  # get 'feedback/create'
  root to: 'pages#home'
  get 'pages/about'
  get 'feedbacks', to: 'feedback#new'
  post 'feedbacks', to: 'feedback#create'
  get 'search_username', to: 'feedback#search_username'
  post 'display_username', to: 'feedback#display_username'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories
end
