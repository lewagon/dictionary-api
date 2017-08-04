class AddAutoCompleteHitsToCounter < ActiveRecord::Migration[5.1]
  def change
    add_column :counters, :autocomplete, :integer
  end
end
