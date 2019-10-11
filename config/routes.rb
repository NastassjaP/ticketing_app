Rails.application.routes.draw do
  devise_for :users

  get 'marketplace', :to => 'marketplace#index', :as => 'marketplace'
  patch 'marketplace', :to => 'marketplace#edit', :as => 'edit_marketplace'
  get 'marketplace/:id', :to => 'marketplace#show', :as => 'show_marketplace'

  get 'admin/:id/my_events', :to => 'admin#my_events_index', :as => 'my_events'

  resources :admin, :normal, :categories, :events, :accounts

  resources :events do
    resources :account_transactions
  end
  
  devise_scope :user do
    root to: "devise/sessions#new"
  end



end
