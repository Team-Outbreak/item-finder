Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/more_info'
  get 'welcome/suggestion_form'
  get 'welcome/feedback_form'
  post 'welcome/search_related_image'

  resources :items do
    resources :associations do
      post 'increase_ranking'
      post 'decrease_ranking'
    end
  end

  root 'welcome#index'
end
