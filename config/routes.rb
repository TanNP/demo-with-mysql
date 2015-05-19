Rails.application.routes.draw do

  

  resources :supplies

  get 'page/index'

  get 'page/product'

  devise_for :admins
  get 'excercise/excercise1'
  post 'excercise/excercise1'
  get 'excercise/excercise2'
  post 'excercise/excercise2'
  get 'excercise/excercise3'
  get 'excercise/excercise4'
  get 'excercise/excercise5'
  devise_for :users, controllers: { registrations: "users/registrations" }

  get 'product_user/index'

  get 'product_user/show/:id' => "product_user#show", :as => 'product_user_show'

  resources :products do
    get 'page/:page', :action => :index, :on => :collection
    resources :comments
  end

  get 'home/sayhello'
  get 'home/contact_us'
  get 'home/about'
  get 'home/services'
  get 'home/access_denied'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#sayhello'

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