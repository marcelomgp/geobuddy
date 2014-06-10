class OccurrenceSerializer < ActiveModel::Serializer
  attributes :occurrence_type_id, :description, :coordinate
end
