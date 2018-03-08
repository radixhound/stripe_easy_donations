Rails.application.routes.draw do
  resources :donations
  post 'custom-donation', to: 'donations#custom', as: :custom_donation
  root to: "donations#index"
end
