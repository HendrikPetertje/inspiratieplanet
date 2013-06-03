Inspiratieplanet::Application.routes.draw do
  
  get 'pages/:privacy/' => 'pages#show', :as => 'page_name_page'
  get 'pages/:privacy/edit' => 'pages#edit', :as => 'page_name_edit'

  resources :pages


  resources :categories do 
    resources :articles
  end


  resources :articles do
    resources :reviews 
  end
  devise_for :users
  resources :favorites



  get "dashboard/admin"
  get "dashboard/user"
  get "dashboard/manage_user"
  get "reviews/reviews"
  get "category/show"
  get "privacy/edit"
  get "/categories/categorieen_pagian"

  resources :articles do
      member do
         get :accept
         put :accept
         get :reject
         put :reject
      end   
  end

  root to: 'categories#index'
  match "/login" => "users#sign_in"
  match "/favorites/add/:article_id" => "favorites#create", :as => :favorite
  match "/favorites/destroy/:article_id" => "favorites#destroy"
  match "/category/show" => "categories#show", :as => :category
  match "/pages/" => "pages#index"
  match "/privacy/" => "pages#privacy"
  put "/privacy/edit" => 'pages#wijzigen'


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
