module ApplicationHelper

  def make_occurrences_drop_down
    @occurrence_types = OccurrenceType.all.map { |item| [item.name, item.id] }  
    @occurrence_types.sort
  end

  def coordinate_point
    { 
      type: :Feature,
      geometry: {type: :Point, coordinates: [102.0, 0.5]},
      properties: {prop0: :value0}
    }
  end

end
