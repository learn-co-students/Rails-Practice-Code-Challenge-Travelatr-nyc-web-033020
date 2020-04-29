Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :destinations, only: [:show, :index]
  resources :posts, only: [:index, :show, :new, :edit, :update]
  resources :bloggers, only: [:index, :show, :new, :create]
  
  patch '/postlike/:id', to: 'posts#like_post', as: 'postlike'

end
