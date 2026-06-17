Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }, path: "", path_names: { sign_in: "/login", sign_out: "/logout", registration: "/signup" }

  devise_scope :user do
    get "/role", to: "registrations#role", as: :select_role
  end

  root "orders#index"

  resources :orders

  match "*unmatched", to: "application#not_found", via: :all
end
