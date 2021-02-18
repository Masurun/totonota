Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root 'homes#top'
  resources :users, only: :new
  resources :posts do
    collection do 
      get 'search'
    end
  end
  get "about"=>"homes#about"

end
