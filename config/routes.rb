Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#front'
  resources :pages, only: [:index]

  resources :questions, only: [:index, :show, :create, :destroy], param: :slug do
    resources :answers, only: [:create, :destroy] do
      member do
        post 'vote'
      end
    end
    collection do
      get 'interest'
    end
  end

  resources :searches, only: [:index]

  resources :users, only: [:create, :edit, :show, :update]

  get 'register', to: 'users#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  
end
