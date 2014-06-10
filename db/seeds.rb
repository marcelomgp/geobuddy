# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

OccurrenceType.create([{name: 'Robbery'}, {name: 'Accident'}, {name: 'Suspect'}, {name: 'Complaint'}, {name: 'Missing Person'}])

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
                  
#center = [-22.907675, -43.291499] # Méier, Rio de Janeiro
#radius = 3 # miles
#point_near = Geocoder::Calculations.random_point_near(center, radius)
#point  = "POINT(#{point_near[0]} #{point_near[1]})"

#params = {
  #:occurrence_type  => OccurrenceType.all.sample,
  #:description      => occurrence_description_seed.sample,
  #:coordinate       => point
#}

#report = Occurrence.create(params)
