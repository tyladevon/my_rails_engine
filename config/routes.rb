Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/merchants', to: 'merchants#index'
      get '/merchants/:id/items', to: 'merchants#show'
    end 
  end 
end
