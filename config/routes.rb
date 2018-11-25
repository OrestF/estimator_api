Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: { registrations: 'users/registrations', invitations: 'users/invitations' }
  as :user do
    patch 'users' => 'users/registrations#update'
  end

  resources :organizations, only: %i[index show create update destroy] do
    get :members, on: :member
  end
end
