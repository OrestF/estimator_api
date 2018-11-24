Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  as :user do
    patch 'users' => 'users/registrations#update'
  end

  resources :organizations, only: %i[index show create update destroy] do
    get :members, on: :member
  end
end
