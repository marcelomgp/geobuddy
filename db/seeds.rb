# Create Occurrence Types if table is empty
if OccurrenceType.all.empty?
  OccurrenceType.create([{name: 'Robbery'}, {name: 'Accident'}, {name: 'Suspect'}, {name: 'Complaint'}, {name: 'Missing Person'}])
end

# Create a new random occurrence
(1..5).each do |n|        
  occurrence_description_seed = ['Occurrence_seed '+rand(1..100).to_s,
                                'Occurrence_seed '+rand(1..100).to_s,
                                'Occurrence_seed '+rand(1..100).to_s,
                                'Occurrence_seed '+rand(1..100).to_s,
                                'Occurrence_seed '+rand(1..100).to_s,
                                'Occurrence_seed '+rand(1..100).to_s,
                                'Occurrence_seed '+rand(1..100).to_s,
                                'Occurrence_seed '+rand(1..100).to_s,
                                'Occurrence_seed '+rand(1..100).to_s,
                                'Occurrence_seed '+rand(1..100).to_s]
            
  center = [-22.907675, -43.291499] # Méier, Rio de Janeiro
  radius = 1.5 # miles
  point_near = Geocoder::Calculations.random_point_near(center, radius)
  point  = "POINT(#{point_near[0]} #{point_near[1]})"

  params = {
    :occurrence_type  => OccurrenceType.all.sample,
    :description      => occurrence_description_seed.sample,
    :coordinate       => point
  }

  report = Occurrence.create(params)
end
