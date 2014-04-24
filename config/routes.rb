PinBitcoins::Application.routes.draw do
  resources :users
  
  root "home#index" 

  resources :home  do
    member do
      get 'generate_addr'
      get 'bet_on'
    end
  end

  match 'signup', to: 'users#new', as: 'signup', via: [:get, :post]
  match 'signin', to: 'users#signin', as: 'signin', via: [:get, :post]
  match 'authenticate_user', to: 'users#authenticate_user', as: 'authenticate_user', via: [:get, :post]
  match '/signout',to: 'users#signout',via: :delete
  match 'signout',to: 'users#signout',via: :delete
  match 'bit_addr_info',to: 'home#bit_addr_info',as: 'bit_addr_info',  via: [:get, :post]
  match 'bet_existing',to: 'home#bet_existing',as: 'bet_existing',  via: [:get, :post]
  match 'bet_new',to: 'home#bet_new',as: "bet_new",  via: [:get, :post]
  match 'bet_create',to: 'home#bet_create',as: "bet_create",  via: [:get, :post]


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
