Rails.application.routes.draw do
  resources :transactions
  resources :users do
    get :new_donation, on: :member
    post :donate, on: :member
  end

  root to: "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
