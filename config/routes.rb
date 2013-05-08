Pestr::Application.routes.draw do
  root to: "teams#index"
  resources :teams
end
