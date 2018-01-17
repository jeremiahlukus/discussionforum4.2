Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :comments
    resources :links

    root to: "users#index"
  end

  resources :comments
  devise_for :users
  resources :links do    
       member do      
          put 'like',   to: "links#upvote"
          put 'dislike', to: "links#downvote"
      end
      resources :comments 
    end 

  root to: "links#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end