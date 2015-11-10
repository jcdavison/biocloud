Rails.application.routes.draw do
  namespace :api do
    get 'events', to: 'events#index'
    post 'events', to: 'events#create'
    post 'asset_urls', to: 'asset_urls#create'
    post 'foo', to: 'asset_urls#foo'
  end
end
