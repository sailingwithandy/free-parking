Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

 resources :users, controller: "users", only: [:create, :edit, :update] do
    resource :password, controller: "clearance/passwords", only: [:create, :edit, :update]
    resources :listings do 
      resources :reservations, only: [:create] 
    end
    resources :reservations, only: [:destroy]


  end

 get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'braintree/new'
  post 'braintree/checkout'


   root 'welcome#index'
    get "/auth/:provider/callback" => "sessions#create_from_omniauth"
end