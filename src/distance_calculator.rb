class DistanceCalculator
  EARTH_RADIUS_KM = 6371
  
  def distance_between(first_location, second_location)
    lat_1 = degrees_to_radians(first_location.latitude)
    lat_2 = degrees_to_radians(second_location.latitude)
    lon_1 = degrees_to_radians(first_location.longitude)
    lon_2 = degrees_to_radians(second_location.longitude)
    2 * EARTH_RADIUS_KM * Math.asin(
      Math.sqrt(
        Math.sin((lat_2 - lat_1) / 2)**2 +
        Math.cos(lat_1) *
        Math.cos(lat_2) * 
        Math.sin((lon_2 - lon_1) / 2)**2
      )
    )
  end
  
  private
  
  def degrees_to_radians(value)
    value * Math::PI / 180
  end
end
