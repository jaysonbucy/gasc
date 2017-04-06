Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin_dashboard', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
                                       :registrations => 'users/registrations' }

  authenticated do
    root 'users#index'
  end
  root 'welcome#index'

  get 'welcome/about'
  get 'welcome/coaches'
end
