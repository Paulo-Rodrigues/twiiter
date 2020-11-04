Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: 'twiits#index', as: :authenticated_root
  end

  resources :users , only: [] do
    resources :profiles, only: %i[show edit update]
  end

  resources :twiits, only: %i[index show create destroy] do
    resources :replies, only: :create, module: :twiits
    resources :likes, only: %i[create destroy], module: :twiits
  end

  resources :replies, only: [] do
    resources :replies, only: :create, module: :replies
    resources :likes, only: %i[create], module: :replies
  end

  root to: 'homepage#index'
end
