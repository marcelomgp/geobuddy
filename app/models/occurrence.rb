class Occurrence < ActiveRecord::Base
  
  belongs_to :occurrence_type

  validates :description, presence: true,
                          length: {minimum: 3}

  # defining rgeo factory for column :coordinate
  self.rgeo_factory_generator = RGeo::Geos.factory_generator
  set_rgeo_factory_for_column(:coordinate, RGeo::Geographic.spherical_factory(:srid => 4326))
  
  # defining bounding box
  def self.within_box(w, n, e, s)
    factory = Occurrence.location_factory

    ne = factory.point(n, e)
    nw = factory.point(n, w)
    se = factory.point(s, e)
    sw = factory.point(s, w)

    ring = factory.linear_ring([ne, nw, sw, se])
    bbox = factory.polygon(ring)

    self
      .order(:id => :desc)
      .where("ST_Intersects(coordinate, :bbox)", :bbox => bbox)
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
