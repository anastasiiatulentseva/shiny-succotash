class DistanceCalculator
  
  DUBLIN_OFFICE_COORDS = {
    latitude: 53.339428,
    longitude: -6.257664
  }
  
  DUBLIN_OFFICE_COORDS_RAD = {
    latitude: 0.9309486397304539,
    longitude: -0.10921684028351844
  }
  HERMITAGE = {
    latitude: 59.9398,
    longitude: 30.3146
  }
    
  EARTH_RADIUS_KM = 6371
  
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
    @radian_latitude = gradus_to_radian(latitude)
    @radian_longitude = gradus_to_radian(longitude)
  end
  
  def distance_from_office
   distance_between(
     {latitude: @radian_latitude, longitude: @radian_longitude}, 
     DUBLIN_OFFICE_COORDS_RAD
   )
  end
  
  # for test 
  def distance_from_hermitage
   distance_between(
     {latitude: @radian_latitude, longitude: @radian_longitude}, 
     {latitude: gradus_to_radian(HERMITAGE[:latitude]), longitude: gradus_to_radian(HERMITAGE[:longitude])}
   )
  end
  
  def distance_between(first_point_coords, second_point_coords)
    2 * EARTH_RADIUS_KM * Math.asin(
      Math.sqrt(
        Math.sin(
          (second_point_coords[:latitude] - first_point_coords[:latitude]) / 2
        )**2 +
        Math.cos(first_point_coords[:latitude]) *
        Math.cos(second_point_coords[:latitude]) * 
        Math.sin(
          (second_point_coords[:longitude] - first_point_coords[:longitude]) / 2
        )**2
      )
    )
  end
  
  def gradus_to_radian(value)
    value * Math::PI / 180
  end

end

# p DistanceCalculator.new(53.339428, -6.257664).gradus_to_radian(53.339428)
# p DistanceCalculator.new(55.7539, 37.6208).distance_from_office
