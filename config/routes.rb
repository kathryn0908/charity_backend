Rails.application.routes.draw do
  resources :charities, only: [:index, :update, :show, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
