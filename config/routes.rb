Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations"
  }
  root to: 'pages#home'
  get 'pages/about'
  get 'feedbacks', to: 'feedback#new'
  post 'feedbacks', to: 'feedback#create'
  resources :articles
  resources :users, except: [:new]
  resources :categories
end
