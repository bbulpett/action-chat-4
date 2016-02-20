Rails.application.routes.draw do
  
  
  get 'rooms/show'

  get  'onboarding' => 'onboarding#index'
  post 'onboarding' => 'onboarding#continue'
    
  resources :users, only: [:index, :show] do
    collection do
      get 'list'
    end
    member do
      post 'impersonate'
    end
  end

  mount Hello::Engine => "/hello"
  root to: 'rooms#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
