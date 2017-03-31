Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  authenticated do
    root 'users#index'
  end
  root 'welcome#index'

  get 'welcome/about'
  get 'welcome/coaches'
end
