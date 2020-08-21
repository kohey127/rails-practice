class Relationship < ActiveRecord::Migration[5.2]
  def change
	drop_table :relationships
	drop_table :ralationships
  end
end
