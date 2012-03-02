TaskMate::Application.routes.draw do
  devise_for :users

  resources :users, :except => [:create, :index]

  root :to => 'tasks#index'
  resources :tasks

end
