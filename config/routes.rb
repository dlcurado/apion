require 'api_version_constraint'

Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # constraints { subdomain: 'api' } => Substitui o www. por api. no comeco da URL
  # path: '/' => tira a necessidade de identificar o /api apos a URL completa, deixando a URL para 
  # a nossa API dessa forma:
  # api.apion.com/[model]
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
    namespace :v1, path: '/', constraints: ApiVersionConstraint.new(version: 1, default: true) do
      resources :users, only: [:show, :create, :update]
    end
  end

end
