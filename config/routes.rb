Rails.application.routes.draw do
  resources :employees
  resources :problems
  get "/submit", to: "problems#new"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/new", to: "sessions#new"
  post "/user", to: "sessions#create"
  post "/login", to: "sessions#login"
  get "/index", to: "users#index"
  get "/log_out", to: "users#log_out"
  get "/", to: "sessions#log_in"
  get "/new_issue", to: "issues#new"
  # post "/issue", to: "issues#create"
  get "/show", to: "issues#show"
  # get "/pass", to: "employees#pass"
  post "/problem", to: "employees#update"
  get "/issue", to: "employees#issue"
  get "/new_user", to: "sessions#new_user"
  post "/employee", to: "sessions#create_user"
  get "/users", to: "employees#index"
  get "/profile", to: "users#profile"
  post "/upprofile", to: "users#update_profile"
  post "/edit_user", to: "users#update"
  post "/pass", to: "employees#pass"
  post "/block", to: "employees#block"
  post "/active", to: "employees#active"
  get "/submit_issue", to: "problems#new"
  post "/submit_issue", to: "problems#create"
  # get "/accept", to: "users#accept"
  # post "/issue_accept", to: "users#accept_issue"
  post "/feed", to: "sessions#comment"
  post "/confirm", to: "problems#confirm"
  post "/accept", to: "users#accept_issue"
  # post "/bill_of_material", to: "users#accept_issue"
  post "/confirm_issue", to: "employees#confirm"
  get "/report", to: "employees#report"
  get "/about", to: "employees#about"
  post "/select", to: "employees#about"
  get "/confirmed_issue", to: "users#confirmed_issue"
  get "/help", to: "additions#help"
  get "/addition", to: "additions#addition"
  post "/gover", to: "additions#new_gover"
  post "/city", to: "additions#new_city"
  post "/cat", to: "additions#new_cat"
  post "/mat", to: "additions#new_mat"
  get "/accept_status", to: "users#accept_status"
  # post "/accept", to: "users#accept_problem"
  post "/join_issue", to: "users#join"

  resources :users do
    member do
      patch :accept
    end
  end
  resources :issues
  resources :employees do
    member do
      patch :block
      post :pass
    end
  end
end
