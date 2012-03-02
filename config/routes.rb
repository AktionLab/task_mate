TaskMate::Application.routes.draw do
  devise_for :users

  resources :users, :only => [:show]

  root :to => 'tasks#index'
  resources :tasks

end
