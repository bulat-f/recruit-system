class Location < ApplicationRecord
  has_one :user_home, class_name: 'Cleaner', foreign_key: 'home_location'
  has_one :user_work, class_name: 'Cleaner', foreign_key: 'work_location'

  geocoded_by :address
  after_validation :geocode

  def to_s
    title
  end

  def street
    [street_number, street_name].join ' '
  end

  def address
    [street, city, state, zip_code, 'US'].join
  end

  def google_place
    GoogleDistanceMatrix::Place.new lng: longitude, lat: latitude
  end
end
