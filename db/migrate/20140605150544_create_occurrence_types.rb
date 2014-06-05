class CreateOccurrenceTypes < ActiveRecord::Migration
  def change
    create_table :occurrence_types do |t|
      t.string :occurrence_type

      t.timestamps
    end
  end
end
