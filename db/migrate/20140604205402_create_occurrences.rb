class CreateOccurrences < ActiveRecord::Migration
  def change
    create_table :occurrences do |t|
      #t.string :type
      t.string :description
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
