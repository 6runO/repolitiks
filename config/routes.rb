Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root to: 'pages#home'
  get '/user' => "pages#minha", as: :user_root
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :candidatos, only: [:index, :show] do
    resources :marcados, only: [:create]
  end
  resources :marcados, only: [:update]
end
