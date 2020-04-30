Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, only: [:index, :show, :new, :create]
  resources :destinations, only: [:show]
  resources :posts, only: [:show, :edit, :update, :new, :create]
  patch '/posts/:id/add', to: 'posts#add', as: "add_like"

  # patch '/postlike/:id', to: 'posts#like_post', as: 'postlike'
end
