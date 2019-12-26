class CreateOuting < ActiveRecord::Migration[5.2]
  def change
    create_table :outings do |t|
      t.string :name
    end
  end
end
