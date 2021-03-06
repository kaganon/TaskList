Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'tasks#index'

  resources :tasks
  
  # get '/tasks/new', to: 'tasks#new', as: 'new_task'
  # post '/tasks', to: 'tasks#create', as: 'tasks'
  #
  # get 'tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  # patch 'tasks/:id', to: 'tasks#update'
  #
  # get '/tasks', to: 'tasks#index'
  # get '/tasks/:id', to: 'tasks#show', as: 'task'
  #
  # delete 'tasks/:id', to: 'tasks#destroy'

  patch 'tasks/:id/complete', to: 'tasks#complete', as: 'complete_task'
  patch 'tasks/:id/incomplete', to: 'tasks#incomplete', as: 'incomplete_task'

end
