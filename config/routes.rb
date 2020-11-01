Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: 'twiits#index', as: :authenticated_root
  end

  resources :twiits, only: %i[index create destroy]

  root to: 'homepage#index'
end
