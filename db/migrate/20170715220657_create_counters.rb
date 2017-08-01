class CreateCounters < ActiveRecord::Migration[5.1]
  def change
    create_table :counters do |t|
      t.integer :found
      t.integer :hits
    end
  end
end
