module ApplicationHelper

  # returns drop down list of Occurrence Types
  def make_occurrences_drop_down
    @occurrence_types = OccurrenceType.all.map { |item| [item.name, item.id] }  
    @occurrence_types.sort
  end

end
