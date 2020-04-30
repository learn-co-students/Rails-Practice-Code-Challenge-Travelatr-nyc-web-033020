Rails.application.routes.draw do
  get 'posts/new'

  get 'posts/edit'

  get 'posts/index'

  get 'posts/show'

  get 'posts/_form'

  get 'destinations/new'

  get 'destinations/edit'

  get 'destinations/index'

  get 'destinations/show'

  get 'destinations/_form'

  get 'bloggers/new'

  get 'bloggers/edit'

  get 'bloggers/index'

  get 'bloggers/show'

  get 'bloggers/_form'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers 
  resources :destinations 
  resources :posts 
  patch '/posts/:id/add', to: 'posts#add', as: "add_like"
end
