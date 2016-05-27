Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :locations, only: [:index, :show] do

      end

      resources :location_categories, only: [:index, :show]

      resource :landmark, only: [:show]
    end
  end

  namespace :admin do
    resources :landmarks

    root to: "landmarks#index"
  end

  root to: "landmark#show"
end
