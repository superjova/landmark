Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :locations do

      end

      resource :landmark, only: [:show]
    end
  end

  namespace :admin do
    resources :landmarks

    root to: "landmarks#index"
  end

  root to: "landmark#show"
end
