json.occurrences @occurrences do |occurrence|
  json.type 'Feature'
  json.geometry do |json|
    json.type 'Point'
    json.coordinates [occurrence.coordinate.lon, occurrence.coordinate.lat]
  end
  json.properties do |json|
    json.id              occurrence.id
    json.occurrenceType  occurrence.occurrence_type.name
    json.description     occurrence.description
  end
end

