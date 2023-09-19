Rails.application.routes.draw do
  scope :api do
    resources :articles

    scope :auth do
      post 'login', to: 'auth#login'
      post 'register', to: 'auth#register'
      get 'profile', to: 'auth#profile'
    end
  end
end
