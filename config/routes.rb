Rails.application.routes.draw do
  resources :bounces
  resources :users do
    collection do
      post 'login'
    end
  end
end
