Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks, only: [:index, :show, :create, :update, :destroy] do
        member do
          patch 'update_name'
          patch 'update_date_completed'
        end
      end
      resources :lists, only: [:index, :show, :create, :update]
    end
  end
end