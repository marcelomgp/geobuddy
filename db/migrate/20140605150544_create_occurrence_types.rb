class CreateOccurrenceTypes < ActiveRecord::Migration
  def change
    create_table :occurrence_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
