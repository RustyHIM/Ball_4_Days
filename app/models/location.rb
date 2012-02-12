class Location < ActiveRecord::Base
attr_accessbile :venue
geocoded_by(venue_attr, options = {}, &block)
after_validation :geocode


belongs_to :microposts
end
