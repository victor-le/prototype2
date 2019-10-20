require 'sidekiq/web'

Rails.application.routes.draw do
  resources :app_schedules
  resources :special_requirements
  resources :client_addresses
  resources :app_times
  resources :app_durations
  resources :app_addresses
  resources :services
  resources :clients
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
