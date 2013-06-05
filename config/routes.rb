FirstRoutes::Application.routes.draw do
  resources :users do
    get 'contacts/search' => 'contacts#search'
    get 'contacts/favorites'=> 'contacts#favorites'
    resources :contacts
    resources :favorites, :only => [:create, :destroy]
  end

#  resources :token, :only => [:create, :destroy]
  post 'login' => 'tokens#create'
  delete 'logout' => 'tokens#destroy'
end