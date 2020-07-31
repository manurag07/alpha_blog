Rails.application.routes.draw do
  # get 'feedback/new'
  # get 'feedback/create'
  root to: 'pages#home'
  get 'pages/about'
  get 'feedbacks', to: 'feedback#new'
  post 'feedbacks', to: 'feedback#create'
  # root to: 'articles/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories
end
