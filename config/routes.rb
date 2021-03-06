Rails.application.routes.draw do
  namespace :admin do
    resources :tournaments, only: [:index]
    resources :competitors, only: [:index, :new, :create]
    resources :one_off_competitions, only: [:create, :show] do
      resources :players, only: [:create], module: :one_off_competitions
      resource :state, only: [:create, :destroy], module: :one_off_competitions
      resource :points, only: [:create], module: :one_off_competitions
    end
  end
end
