Rails.application.routes.draw do
  get 'users' => 'users#index'
  # get 'users/show'
  # get 'users/new'
  # post 'users/create'
  get 'users/edit'
  put 'users/update'
  delete 'users/destroy'
  root :to => 'users#index'

  get 'users/new' => 'users#new'
  post 'users' => 'users#create'
  get 'users/:id' => 'users#show', as: 'user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
