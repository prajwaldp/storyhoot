Rails.application.routes.draw do

  root 'static_pages#home'
  get 'about', to: 'static_pages/about', :as => :about
  get 'contact', to: 'static_pages/contact', :as => :contact

  resources :uploads, only: [:create, :destroy]

  get 'support_tickets/new'
  get 'support_tickets/create'
  get 'support', to: 'support_tickets#new'

  resources :books, path: '/story/' do
    member do
      put "like", to: 'books#like'
      put "unlike", to: 'books#unlike'
    end
  end
  get 'gif-maker-pictures', to: 'books#gif_maker_pictures', :as => :gif_maker_pictures
  get 'gif-maker-video', to: 'books#gif_maker_video', :as => :gif_maker_video
  get 'gif-upload', to: 'books#gif_upload', :as => :gif_upload
  get 'discover', to: 'books#discover', :as => :discover
  resources :categories, only: [:index, :show]

  resources :subscriptions
  resources :reports, only: [:new, :create, :destroy]
  resources :comments, only: [:new, :create, :destroy]
  resources :bulletins, only: [:index]
  resources :support_tickets, only: [:new, :create]
  get 'notifications', to: 'bulletins#index'
  resources :hashtags, only: [:index]

  resources :users, path: '/u' do
    member do
      get :subscribers
      get :activate
    end
  end
  post 'users/change_password'
  post 'users/change_username'
  get 'feed', to: 'users#newsfeed'
  get 'find-authors', to: 'users#find_authors', :as => :find_authors
  get 'complete-facebook-sign-up', to: 'users#complete_facebook_sign_up', :as => :complete_facebook_sign_up
  post 'users/verify_account'
  
  resources :sessions, only: [:create, :destroy]
  get 'login', to: 'sessions#new', :as => :login
  post 'logout', to: 'sessions#destroy', :as => :logout
  
  resources :password_resets
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

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
