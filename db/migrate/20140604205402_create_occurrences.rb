class CreateOccurrences < ActiveRecord::Migration
  def change
    create_table :occurrences do |t|
      t.string :description
      t.float :lat
      t.float :long
      t.belongs_to :occurrence_types

      t.timestamps
    end
  end
end
