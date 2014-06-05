# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    OccurrenceType.create(
                          [
                            {occurrence_type: 'Bank robbery'}, 
                            {occurrence_type: 'Robbery'}, 
                            {occurrence_type: 'Accident with victim'},
                            {occurrence_type: 'Accident'},
                            {occurrence_type: 'Suspect'},
                            {occurrence_type: 'Complaint'}
                          ]
                         )
