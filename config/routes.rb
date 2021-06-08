Rails.application.routes.draw do
  get '',to: "app#home"
  get 'blog',to: "app#blog"
  get 'app/post'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
