Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#front'

  resources :questions, only: [:index, :show] do
    resources :answers, only: [:create]  
  end
  
end
