Wheretomigrate::Application.routes.draw do
  resources :transit_scores


  resources :crimes
  resources :cost_livings
  resources :races
  resources :jobs_cities
  resources :cities
  resources :counties

  # The priority is based upon order of creation:
  # first created -> highest priority.


  match 'race_bangladeshi' => "Races#race_bangladeshi"
  match 'race_bhutanese' => "Races#race_bhutanese"
  match 'race_burmese' => "Races#race_burmese"
  match 'race_cambodian' => "Races#race_cambodian"
  match 'race_chinese' => "Races#race_chinese"
  match 'race_filipino' => "Races#race_filipino"
  match 'race_hmong' => "Races#race_hmong"
  match 'race_indian' => "Races#race_indian"
  match 'race_indonesian' => "Races#race_indonesian"
  match 'race_japanese' => "Races#race_japanese"
  match 'race_korean' => "Races#race_korean"
  match 'race_laotian' => "Races#race_laotian"
  match 'race_malaysian' => "Races#race_malaysian"

  match 'race_nepalese' => "Races#race_nepalese"
  match 'race_pakistani' => "Races#race_pakistani"
  match 'race_srilankan' => "Races#race_srilankan"
  match 'race_taiwanese' => "Races#race_taiwanese"
  match 'race_thai' => "Races#race_thai"
  match 'race_vietnamese' => "Races#race_vietnamese"
  

  match 'test' => "Home#index"
  match 'city' => "static_pages#city"

  root :to => "static_pages#main"

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
