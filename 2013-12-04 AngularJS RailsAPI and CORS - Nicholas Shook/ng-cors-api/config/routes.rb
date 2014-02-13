NgCorsApi::Application.routes.draw do
  post 'secret', to: 'secret#index'
end
