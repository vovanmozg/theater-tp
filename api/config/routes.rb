Rails.application.routes.draw do
  resources :events, defaults: { format: :json }
end
