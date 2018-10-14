Rails.application.routes.draw do
  namespace :account do
    resources :dashboard
    resources :projects do
      resources :tasks
    end
  end
  get 'hello_world', to: 'hello_world#index'
  get 'index', to: 'dashboard#index'
end
