# frozen_string_literal: true

class Location
  Error = Class.new(StandardError)
  ArgumentError = Class.new(Error)
  InvalidRangeError = Class.new(ArgumentError)
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = Float(latitude)
    @longitude = Float(longitude)
    check_range
  rescue ::ArgumentError, ::TypeError => e
    raise ArgumentError, "Cannot create location due to: #{e.message}"
  end

  def distance_from(another_location)
    DistanceCalculator.new.distance_between(self, another_location)
  end

  private

  def check_range
    unless latitude.between?(-90, 90)
      raise InvalidRangeError, 'Cannot create location. Latitude is out of range.'
    end
    unless longitude.between?(-180, 180)
      raise InvalidRangeError, 'Cannot create location. Longitude is out of range.'
    end
  end
end
