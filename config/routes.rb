Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => 'users/registrations',  sessions: 'users/sessions'}

  # line bot
  post 'line/callback', to: 'bots/line#callback'

  # constraints(Domain::Api) do
  namespace :api, path: nil, constraints: {subdomain: 'api' }, defaults: {format: 'json'} do
    scope :all, as: :api do
      get '/apb/:limit', to: 'api#all_apb',   as: 'apb', constraints: {:limit => /\d*/}
      get '/apb/*limit', to: 'api#error'
      get '/apb', to: 'api#all_apb'

      get '/orange/:limit', to: 'api#all_orange',   as: 'orange', constraints: {:limit => /\d*/}
      get '/orange/*limit', to: 'api#error'
      get '/orange', to: 'api#all_orange'

      get '/:limit', to: 'api#all',   as: 'all', constraints: {:limit => /\d*/}
      get '/*limit', to: 'api#error'
      get '/', to: 'api#all'
    end

    get 'next/:next', to: 'api#next',  as: 'next', constraints: {:next => /\d*/}
    get 'next/*next', to: 'api#error'

    get 'now',  to: 'api#now'
    get 'info', to: 'api#info'
  end

  get 'next/:next', to: 'index#next',  as: 'next', constraints: {:next => /\d*/}
  get "next/*next" => redirect("/")

  get 'apb',      to: "page#apb"
  get 'orange',   to: "page#orange"
  get 'about',    to: "page#about"
  get 'doc',      to: "page#doc"
  get 'announce', to: 'page#announce'
  get 'doc/api',  to: 'page#api', as: 'api_doc'

  root 'index#index'

  namespace :admin do
    resources :buses, :oranges, :users

    namespace :settings do
      resources :buses, only: [:index, :edit, :update]
      resources :oranges, only: [:index, :edit, :update]
    end
    root 'index#index'
  end

  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
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
