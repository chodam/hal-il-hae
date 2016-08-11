Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  resources :todo_lists do
    resources :todo_items, :comments do
      member do
        patch :complete
      end
    end
  end
  
  root "todo_lists#index"
  post "comments/comment"
  get "/todo_lists/:todo_list_id"
  post "/todo_items/complete" => "/todo_lists/:todo_list_id/todo_items"
  
end