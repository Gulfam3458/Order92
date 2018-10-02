Rails.application.routes.draw do
  resources :products
    get 'order/index'
    # root 'order#index'
   root 'products#new'
  resources :phone_numbers, only: [:new, :create]
  post 'phone_numbers/verify' => "phone_numbers#verify"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
