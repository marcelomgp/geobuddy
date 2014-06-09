class RemoveLatLongFromOccurrence < ActiveRecord::Migration
  def change
    remove_column :occurrences, :lat, :float
    remove_column :occurrences, :long, :float
  end
end
