ThingsToDo::Application.routes.draw do
  root 'todos#index'
  resources :todos do 
    member do 
      put :done
    end
  end
end
