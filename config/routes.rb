Rails.application.routes.draw do
  devise_for :users

  authenticated do
    root 'user#index'
  end
  root 'welcome#index'

  get 'welcome/about'
  get 'welcome/coaches'
end
