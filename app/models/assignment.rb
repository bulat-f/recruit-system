class Assignment < ApplicationRecord
  validates :zip_code, presence: true
  validates :radius, presence: true
  validates :message, presence: true

  def google_place
    GoogleDistanceMatrix::Place.new address: zip_code
  end

  def matrix(locations)
    origins = locations.map(&:google_place)
    matrix = GoogleDistanceMatrix::Matrix.new origins: origins, destinations: google_place
  end

  def distances_to_locations(locations)
    matrix(locations).data.map.with_index do |data, index|
      {
        location: locations[index],
        distance: data.last.distance_in_meters,
        duration: data.last.duration_in_seconds
      }
    end
  end

  def distances_to_cleaners(cleaners)
    location_ids = cleaners.map(&:home_location_id)
    locations = Location.where(id: location_ids)
    matrix(locations).data.map.with_index do |data, index|
      {
        cleaner: cleaners[index],
        distance: data.last.distance_in_meters,
        duration: data.last.duration_in_seconds
      }
    end
  end
end
