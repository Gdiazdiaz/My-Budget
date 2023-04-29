Rails.application.routes.draw do
  devise_for :users, controllers: { 
    sessions: 'user/sessions',
    registrations: 'user/registrations',
    passwords: 'user/passwords' 
  }

  resources :users do
    root :to => 'groups#index'
    resources :groups do
      resources :movements
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index
  
  root "pages#splash"

end