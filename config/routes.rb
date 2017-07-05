Rails.application.routes.draw do
  root to: 'words#home'
  get '/:word', to: 'words#query', as: 'query'

  get '*unmatched_route', to: 'words#redirect'
end
