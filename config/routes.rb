Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # verb "url", to: "controller#action"
  get "/tasks", to: "tasks#index"

  # CRUD
  # CREATE, READ, UPDATE, DELETE

  # Read all the tasks
  get "/tasks", to: "tasks#index"

  # Read one task
  get "/tasks/:id", to: "tasks#show"

  # Create a task
  get "/tasks/new", to: "tasks#new" # Display the form
  post "/tasks", to: "tasks#create"

  # Update a task
  get "/tasks/:id/edit", to: "tasks#edit"
  patch "/tasks/:id", to: "tasks#update"

  # Delete a task
  delete "/tasks/:id", to: "tasks#destroy"
end
