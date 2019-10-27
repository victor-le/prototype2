require 'sidekiq/web'

Rails.application.routes.draw do
  resources :app_schedules
  resources :special_requirements
  resources :app_times
  resources :app_durations
  resources :services
  resources :users, only: [:index]
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end
  devise_for :users
  get 'active-sessions', to: "app_schedules#active_sessions"
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
