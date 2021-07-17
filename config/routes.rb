Rails.application.routes.draw do
  get 'order/index'
  get 'landing/index'
  resources :products, only: [:show, :index]
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  root to: 'landing#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  resources :users, only: [] do
    resource :profile, controller: :profile
 end
end
