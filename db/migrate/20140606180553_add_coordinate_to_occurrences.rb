class AddCoordinateToOccurrences < ActiveRecord::Migration
  def change
    add_column :occurrences, :coordinate, :point, :geographic => true
  end
end
