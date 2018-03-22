Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#front'

  resources :questions, only: [:index, :show, :create] do
    resources :answers, only: [:create]  
    collection do
      get 'interest'
    end
  end





  resources :users, only: [:create, :edit, :show, :update]

  get 'register', to: 'users#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  
end
