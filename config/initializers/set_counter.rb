begin
  $counter = Counter.find(1)
rescue ActiveRecord::NoDatabaseError, ActiveRecord::RecordNotFound, ActiveRecord::StatementInvalid
  # Let `rails db:create db:migrate db:seed` do their job
end
