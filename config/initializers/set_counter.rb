begin
  $counter = Counter.find(1)
rescue ActiveRecord::NoDatabaseError, ActiveRecord::RecordNotFound
  # Let `rails db:create db:migrate db:seed` do their job
end
