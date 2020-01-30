Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/merchants/', to: 'merchants#index'
      get '/merchants/find', to: 'merchants#find'
      get '/merchants/find_all', to: 'merchants#find_all'
      get '/merchants/random', to: 'merchants#random'
      get '/merchants/:merch_id', to: 'merchants#show'
      get '/merchants/:merch_id/items', to: 'merchants#index'
      get '/merchants/most_revenue', to: 'merchants#most_revenue'

      get '/items', to: 'items#index'
      get '/items/:item_id', to: 'items#show'
      get '/items/find', to: 'items#find'
      get '/items/find_all', to: 'items#find_all'
      get '/items/random', to: 'items#random'

      get '/invoices', to: 'invoices#index'
      get '/invoices/:invoices_id', to: 'invoices#show'
      get '/invoices/find', to: 'invoices#find'
      get '/invoices/find_all', to: 'invoices#find_all'
      get '/invoices/random', to: 'invoices#random'
    end 
  end
end 
