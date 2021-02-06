Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create]
  
  get 'tasks', to: 'tasks#index'
  get 'exclude_finished', to: 'tasks#exclude_finished'
  
  resources :tasks, only: [:new, :edit, :update, :create, :destroy]

#   resources :categories, only: [:new, :create] # カテゴリの削除必要？
  
end
