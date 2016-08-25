Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "callbacks", registrations: "users/registrations" }
  
  resources :todo_lists do
    resources :todo_items, :comments do
      member do
        patch :complete
      end
    end
  end
  
  root "todo_lists#index"
  post "todo_lists/comment" => "todo_lists#comment"
  #get "/todo_lists/:todo_list_id"
  get "/todo_items/complete"=>"todo_items#complete"
  #post "todo_items/complete" => "todo_items#complete"
  #post "" => "todo_items#complete"
  post "todo_items/upload/:id" => 'todo_items#upload', as: :todo_item_upload
  get '/mypage/home' => 'mypage#home'
  get 'mypage/check'
  get '/todo_lists/main' =>'todo_lists#main'
   
end

