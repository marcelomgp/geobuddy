class Occurrence < ActiveRecord::Base
  
  self.rgeo_factory_generator = RGeo::Geos.factory_generator
  set_rgeo_factory_for_column(:coordinate, RGeo::Geographic.spherical_factory(:srid => 4326))
end
