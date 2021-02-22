Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root 'homes#top'
  get "about"=>"homes#about"
  resources :posts do
    resources :favorites, only: [:create,:destroy]
    collection do 
      get 'search'
    end 
  end
  resources :users,only:[:show,:new]
end
