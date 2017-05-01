Rails.application.routes.draw do
  resources :bounces
  resources :users, only: :create do
    collection do
      post 'login'
    end
  end
end
