Rails.application.routes.draw do
  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :dashboard, only: [:index]
end
