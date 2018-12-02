Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: { registrations: 'users/registrations', invitations: 'users/invitations' }
  as :user do
    patch 'users' => 'users/registrations#update'
  end

  resources :organizations, only: %i[index show create update destroy] do
    get :members, on: :member
  end

  scope :organization do
    resources :projects, only: %i[index show create update destroy] do
      put :assign_estimators
      put :remove_estimators
      get :reports
    end
  end

  resources :reports, only: %i[show create destroy]
  resources :report_tasks
end
