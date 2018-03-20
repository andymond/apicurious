Rails.application.routes.draw do
  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"
  resources :dashboard, only: [:index]
end
