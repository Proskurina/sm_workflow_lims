Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'batches#new'

  resources :flows, only: [:show] do
    resources :assets, only: [:index]
  end

  get 'assets/update'

  resources :batches, except: [:index, :edit]

  resources :admin, only: [:index] do
    collection do
      resources :workflows, only: [:show, :update, :create]
      resources :pipeline_destinations, only: [:create]
    end
  end

  resources :reports, only: [:new] do
    collection do
      post :create
      get :show
      get :csv
    end
  end


end
