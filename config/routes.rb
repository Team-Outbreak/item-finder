Rails.application.routes.draw do
  get 'welcome/index'

  resources :items

  root 'welcome#index'
end
