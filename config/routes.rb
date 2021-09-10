Rails.application.routes.draw do
  devise_for :users
  resources :empresas do
    resources :projetos
    resources :rhs
  end

  resources :users, only: %i[ show ]
  
  root to: "empresas#index"
end
