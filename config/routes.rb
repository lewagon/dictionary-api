Rails.application.routes.draw do
  root to: "words#home"
  get "/:word", to: "words#query", as: "query"
  get "/autocomplete/:stem", to: "words#autocomplete", as: "autocomplete"

  get "*unmatched_route", to: "words#redirect"
end
