Rails.application.routes.draw do
  root to: 'words#home'
  get '/:word', to: 'words#query', as: 'query'
end
