Final::Application.routes.draw do

  root :to => 'output_folders#index'

  resources :output_folders

  match "clients/search" => "clients#search", :as => :client_search
  resources :clients

  match "entry_folders/search_supplier" => "entry_folders#search_supplier", :as => :search_supplier
  resources :entry_folders
  
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

  #Brand
  match "brand/index" => "brand#index", :as => :brand_index
  match "brand/destroy" => "brand#destroy", :as => :brand_destroy
  match "brand/update" => "brand#update", :as => :brand_update
  match "brand/create" => "brand#create", :as => :brand_create

  match "brand/parent_model_index" => "brand#parent_model_index", :as => :parent_model_index
  match "brand/parent_model_destroy" => "brand#parent_model_destroy", :as => :parent_model_destroy
  match "brand/parent_model_update" => "brand#parent_model_update", :as => :parent_model_update
  match "brand/create_class" => "brand#create_class", :as => :class_create
  match "brand/destroy_class" => "brand#destroy_class", :as => :destroy_class

  match "brand/model_type_index" => "brand#model_type_index", :as => :model_type_index
  match "brand/create_model_type" => "brand#create_model_type", :as => :create_model_type
  match "brand/model_type_destroy" => "brand#model_type_destroy", :as => :model_type_destroy
  match "brand/model_type_update" => "brand#model_type_update", :as => :model_type_update

  match "brand/create_model" => "brand#create_model", :as => :model_create
  match "brand/update_model" => "brand#update_model", :as => :model_update
  match "brand/destroy_model" => "brand#destroy_model", :as => :model_destroy

  match "brand/create_model_one" => "brand#create_model_one", :as => :model_create_one
  
  #Product
  match "products/model_changer" => "products#model_changer", :as => :model_changer
  match "products/search" => "products#search", :as => :product_search
  match "products/second_search" => "products#second_search", :as => :second_search
  match "products/last_search" => "products#last_search", :as => :last_search
  resources :products

  #CodeEntry
  match "entry_code/search" => "entry_code#search", :as => :code_entry_search
  match "entry_code/result" => "entry_code#result", :as => :code_entry_result
  match "entry_code/register" => "entry_code#register", :as => :code_entry_register
  match "entry_code/show" => "entry_code#show", :as => :code_entry_show
  match "entry_code/save_codes" => "entry_code#save_codes", :as => :entry_code_save_codes

  #OutputCode
  match "output_code/search" => "output_code#search", :as => :code_output_search
  match "output_code/register" => "output_code#register", :as => :code_output_register
  match "output_code/result" => "output_code#result", :as => :code_output_result
  match "output_code/save_codes" => "output_code#save_codes", :as => :code_output_save_codes
  match "output_code/show" => "output_code#show", :as => :code_output_show

  #SellPrice
  match "sell_price/search" => "sell_price#search", :as => :sell_price_search
  match "sell_price/result" => "sell_price#result", :as => :sell_price_result
  match "sell_price/register" => "sell_price#register", :as => :sell_price_register
  match "sell_price/save_price" => "sell_price#save_price", :as => :sell_price_save_price
  match "sell_price/show" => "sell_price#show", :as => :sell_price_show

  #Supplier
  resources :suppliers

  #Stores
  resources :stores
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
