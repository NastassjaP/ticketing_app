Rails.application.routes.draw do
  devise_for :users

  resources :admin, :normal, :categories
  devise_scope :user do
    authenticated :user do
        root 'admin#show', as: :authenticated_root
      end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

end
