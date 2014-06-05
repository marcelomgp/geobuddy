class OccurrenceType < ActiveRecord::Base

  def self.make_drop_down

    @occurrence_types = OccurrenceType.all.collect { |item| item.occurrence_type }
    
    @occurrence_types.sort
    
  end

end
