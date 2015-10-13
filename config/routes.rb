Rails.application.routes.draw do
  namespace :api do
    get 'events', to: 'events#index'
  end
end
