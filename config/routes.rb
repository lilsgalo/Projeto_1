Rails.application.routes.draw do
  devise_for :users
  resources :empresas do
    resources :projetos
    resources :rhs
  end

  scope "/admin" do
    resources :users
  end
  
  root to: "home#index"
end
