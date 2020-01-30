Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/merchants', to: 'merchants#index'
      get '/merchants/find', to: 'merchants#find'
      get '/merchants/:merch_id', to: 'merchants#show'
      get '/merchants/:id/items', to: 'merchants#index'
      get 'merchants/most_revenue', to: 'merchants#most_revenue'
    end 
  end 
end
