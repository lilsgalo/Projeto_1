Rails.application.routes.draw do
  resources :empresas do
    resources :projetos
    resources :rhs
  end

  # get "/empresas/:id/projetos/new", to: "projetos#new"
  
  root to: "empresas#index"
end
