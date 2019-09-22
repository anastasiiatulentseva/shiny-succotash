# frozen_string_literal: true

class DistanceCalculator
  EARTH_RADIUS_KM = 6371

  def distance_between(first_location, second_location)
    lat1 = degrees_to_radians(first_location.latitude)
    lat2 = degrees_to_radians(second_location.latitude)
    lon1 = degrees_to_radians(first_location.longitude)
    lon2 = degrees_to_radians(second_location.longitude)
    2 * EARTH_RADIUS_KM * Math.asin(
      Math.sqrt(
        Math.sin((lat2 - lat1) / 2)**2 +
        Math.cos(lat1) *
        Math.cos(lat2) *
        Math.sin((lon2 - lon1) / 2)**2
      )
    )
  end

  private

  def degrees_to_radians(value)
    value * Math::PI / 180
  end
end
