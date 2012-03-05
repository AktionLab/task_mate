TaskMate::Application.routes.draw do
  resources :task_lists

  devise_for :users

  resources :users, :only => [:show]

  root :to => 'tasks#new'
  resources :tasks, :except => [:index]
end

