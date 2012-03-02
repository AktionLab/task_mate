TaskMate::Application.routes.draw do
  devise_for :users

  resources :users, :except => [:create, :index, :new, :destroy]

  root :to => 'tasks#index'
  resources :tasks

end
