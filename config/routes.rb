Final::Application.routes.draw do

  root :to => 'document_type#index'
  
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  
  #DocumentType
  match "document_type/index" => "document_type#index", :as => :document_type_index
  match "document_type/create" => "document_type#create", :as => :document_type_create
  match "document_type/destroy" => "document_type#destroy", :as => :document_type_destroy
  match "document_type/update" => "document_type#update", :as => :document_type_update

  #PriceType
  match "price_type/index" => "price_type#index", :as => :price_type_index
  match "price_type/create" => "price_type#create", :as => :price_type_create
  match "price_type/destroy" => "price_type#destroy", :as => :price_type_destroy
  match "price_type/update" => "price_type#update", :as => :price_type_update

  #ModelType
  match "model_type/index" => "model_type#index", :as => :model_type_index
  match "model_type/create" => "model_type#create", :as => :model_type_create
  match "model_type/destroy" => "model_type#destroy", :as => :model_type_destroy
  match "model_type/update" => "model_type#update", :as => :model_type_update

  #ProductType
  match "product_type/index" => "product_type#index", :as => :product_type_index
  match "product_type/create" => "product_type#create", :as => :product_type_create
  match "product_type/update" => "product_type#destroy", :as => :product_type_destroy
  match "product_type/destroy" => "product_type#update", :as => :product_type_update

  #ClientType
  match "client_type/index" => "client_type#index", :as => :client_type_index
  match "client_type/create" => "client_type#create", :as => :client_type_create
  match "client_type/update" => "client_type#destroy", :as => :client_type_destroy
  match "client_type/destroy" => "client_type#update", :as => :client_type_update

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
