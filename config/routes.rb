Rails.application.routes.draw do
  get 'welcome/index'

  resources :items do
    resources :associations
  end

  root 'welcome#index'
end
