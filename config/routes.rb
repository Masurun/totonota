Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root 'homes#top'
  get "about"=>"homes#about"
  get '/posts/searchpost',  to: 'posts#search_post'
  resources :posts do
    collection do 
      get 'search'
    end 
  end
  resources :users,only:[:show,:new]
end
