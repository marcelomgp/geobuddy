class Occurrence < ActiveRecord::Base
  
  belongs_to :occurrence_type

  validates :description, presence: true,
                          length: {minimum: 3}

  self.rgeo_factory_generator = RGeo::Geos.factory_generator
  set_rgeo_factory_for_column(:coordinate, RGeo::Geographic.spherical_factory(:srid => 4326))
  
  def self.within_box(sw_lat, sw_lon, ne_lat, ne_lon)
    factory = RGeo::Geographic.spherical_factory
    sw = factory.point(sw_lon, sw_lat)
    ne = factory.point(ne_lon, ne_lat)
    window = RGeo::Cartesian::BoundingBox.create_from_points(sw, ne).to_geometry
    where(:coordinate, window)
  end

  # returns the rgeo factory for :coordinate column
  def self.location_factory
    factory = Occurrence.rgeo_factory_for_column(:coordinate)
  end

  # returns a point for :coordinate column
  def self.location_point(lng, lat)
    Occurrence.location_factory.point(lng, lat)
  end

end
