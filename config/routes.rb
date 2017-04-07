Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin_dashboard', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
                                       :registrations => 'users/registrations' }

  authenticated do
    root 'users#index'
  end
  root 'welcome#index'

  resources :swim_forms, only: [:index]

  get 'welcome/about'
  get 'welcome/coaches'
  get 'users/terminology'
end
