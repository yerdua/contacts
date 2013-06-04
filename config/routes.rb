FirstRoutes::Application.routes.draw do
  # resources :users
  get    'users'          => 'Users#index'
  post   'users'          => 'Users#create'
  get    'users/new'      => 'Users#new'
  get    'users/:id/edit' => 'Users#edit'
  get    'users/:id'      => 'Users#show'
  put    'users/:id'      => 'Users#update'
  delete 'users/:id'      => 'Users#destroy'
end