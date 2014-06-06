class OccurrenceType < ActiveRecord::Base
  
  has_many :occurrences

  def self.make_drop_down

    @occurrence_types = OccurrenceType.all.collect { |item| item.occurrence_type }
    
    @occurrence_types.sort
    
  end

end
