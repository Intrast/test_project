Rails.application.routes.draw do
  namespace :account do
    resources :dashboard
    resources :projects
    resources :tasks
  end
  get 'hello_world', to: 'hello_world#index'
  get 'index', to: 'dashboard#index'
end
