Rails.application.routes.draw do
  require 'sidekiq/web'

  mount Sidekiq::Web => '/sidekiq'

  post 'authenticate', to: 'authentication#authenticate'
  post '/send_message', to: 'messages#send_message'
end
