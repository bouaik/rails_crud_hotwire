Rails.application.routes.draw do
  get 'highcharts', to: "highcharts#index"
  get :apex, to: 'apex#index'
  get "apex_update/:id", to: "apex#update"
  get "highcharts_update/:id", to: "highcharts#update"
  resources :posts
  root "posts#index"

  get "up" => "rails/health#show", as: :rails_health_check


end
