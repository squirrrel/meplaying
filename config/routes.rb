Notebook::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  #match 'log_in', :to => 'intro#log_in'


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


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  REST request path    | Rails action name | Description
  ---------------------|-------------------|-------------
  GET    /posts        | index             | Render a list of all post
  GET    /posts/new    | new               | Render a form for creating a single new post
  POST   /posts        | create            | Create a single new post from the received data
  GET    /posts/1      |  show           | Render a single existing post
  GET    /posts/1/edit | edit             | Render a form for editing a single existing post
  PUT    /posts/1      | update          | Update a single existing post based on the received data
  DELETE /posts/1      | destroy         | Destroy a single existing post


   get '/posts', to: 'posts#index', as: 'initial'
   get '/posts/new', to: 'posts#new', as: 'new_post'
   post '/posts', to: 'posts#create'
   get '/posts/:id', to: 'posts#show', as: 'particular_post'
   get  '/posts/:id/edit', to: 'posts#edit', as: 'update_post'
   put '/posts/:id', to: 'posts#update'
   delete '/posts/:id', to: 'posts#destroy', as: 'destroy'

   get '/blogs', to: 'blogs#index', as: 'blogs_list'
   get '/blogs/new', to: 'blogs#new', as: 'new_blog'
   post 'blogs', to: 'blogs#create'
   get '/blogs/:id', to: 'blogs#show', as: 'view_blog_elsewhere'
   get  '/blogs/:id/edit', to: 'blogs#edit'
   put '/blogs/:id', to: 'blogs#update'
   delete '/blogs/:id', to: 'blogs#destroy', as: 'destroy'

  get  '/users', to: 'bloggers#index' #for showing the list of registered users on the users form at the bottom on the right
  get  '/users/new', to: 'blogs#new', as: 'new_blog'
  post 'users', to: 'bloggers#create'
  get  '/users/:id', to: 'bloggers#show'
  get  '/users/:id/edit', to: 'bloggers#edit' #for ava editing
  put '/users/:id', to: 'bloggers#update' #for ava editing

end
