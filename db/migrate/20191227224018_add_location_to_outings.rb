class AddLocationToOutings < ActiveRecord::Migration[5.2]
  def change
    add_column :outings, :location, :string
    add_column :outings, :when, :numeric
  end
end
