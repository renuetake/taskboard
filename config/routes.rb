Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create]
  
  get 'tasks', to: 'tasks#index'
  get 'include_finished', to: 'tasks#include_finished'
  
  resources :tasks, only: [:new, :edit, :update, :create] do
    member do
      get :set_child
    end
  end
  
  resources :categories, only: [:new, :create]
  
  resources :relationships, only: [:create, :destroy]

  get 'ganttchart', to: 'gantt#index'
  scope '/gantt' do
    get '/data', to: 'gantt#data'
  end
  

end
