TaskMate::Application.routes.draw do
  root :to => 'root#index'
  resources :task_lists

  devise_for :users

  resources :tasks, :except => [:index]
  resources :task_lists, :except => [:index]

  get '/:id', :to => 'users#show', :as => :user
end

