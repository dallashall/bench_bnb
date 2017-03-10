Rails.application.routes.draw do
  get 'users/create'

  root "root#index"
end
