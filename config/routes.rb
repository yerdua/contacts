FirstRoutes::Application.routes.draw do
  resources :users do
    resources :contacts
    resources :favorites, :only => [:create, :destroy]
    get 'favorite_contacts' => 'contacts#favorites'
  end

#  resources :token, :only => [:create, :destroy]
  post 'login' => 'tokens#create'
  delete 'logout' => 'tokens#destroy'
end