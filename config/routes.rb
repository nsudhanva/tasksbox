Rails.application.routes.draw do


  resources :departments
  resources :employees
  resources :companies
  get 'dashboards/index'
  get 'sandbox/job_results'
  resources :products
  get 'announcements/index'

  get 'announcements/new'

  get 'announcements/create'
  get 'announcements/announce_it'

  get 'tasks/mark_as_complete'
  get 'tasks/mark_as_incomplete'
  resources :categories
  devise_for :users, controllers: { registrations: 'registrations'}
  resources :clients # Does all the below job
  resources :projects
  resources :tasks
  resources :announcements
  
  root to: "clients#index"

  get 'task/tasks' # Only model backed can use resources
  get 'task/incomplete'
  get 'task/overdue'
  get 'sandbox/clients'
  get 'sandbox/projects'

  get 'say/hello'
  get 'say/assignment'
  get 'say/goodbye'
  get 'say/products'


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
