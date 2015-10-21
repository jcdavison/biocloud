Rails.application.routes.draw do
  namespace :api do
    get 'events', to: 'events#index'
    post 'events', to: 'events#create'
  end
end
