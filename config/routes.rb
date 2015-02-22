Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => 'users/registrations',  sessions: 'users/sessions'}

  get 'next/:next', to: 'index#next',  as: 'next', constraints: {:next => /\d*/}
  get "next/*next" => redirect("/")

  get 'apb',    to: "page#apb"
  get 'orange', to: "page#orange"
  get 'about',  to: "page#about"

  root 'index#index'

  namespace :admin do
    resources :buses, :oranges, :users

    namespace :settings do
      resources :buses, only: [:index, :edit, :update]
      resources :oranges, only: [:index, :edit, :update]
    end
    root 'index#index'
  end

  scope :api, as: :api do
    get 'all/:limit', to: 'api#all',   as: 'all', constraints: {:limit => /\d*/}
    get 'all/*limit', to: 'api#error'
    get 'all', to: 'api#all'

    get 'next/:next', to: 'api#next',  as: 'next', constraints: {:next => /\d*/}
    get 'next/*next', to: 'api#error'

    get 'now',  to: 'api#now'
    get 'info', to: 'api#info'

    get 'doc', to: 'api#doc'
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
