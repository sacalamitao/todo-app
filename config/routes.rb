Rails.application.routes.draw do
  resources :todos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1 do
      post 'todo/generate', to: 'todos#create'
      get 'todos', to: 'todos#index'
      post 'todo/edit/:id', to: 'todos#update'
      post 'todo/delete/:id', to: 'todos#destroy'
      post 'todo/dragdrop/:id', to: 'todos#renumber_sort'

      # get 'orders/metrics', to: 'orders#dashboard_metrics'
      # get 'orders/:id', to: 'orders#show'
      # post "transactions", to: 'transactions#callback'
      # get "transactions/:txnid", to: 'transactions#show'
      # get "transactions", to: 'transactions#show'
      # post "payments", to: 'payments#create'
      # post 'webhook/sift-decisions', to: 'sift_decisions#sift_decision'
      # get  'order/status/:obfuscated_id', to: 'sift_decisions#get_order_status'
      # get 'orders', to: 'orders#index'
    end
  end
end
