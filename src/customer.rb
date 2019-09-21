class Customer
  attr_reader :user_id, :name, :location
  
  def initialize(customer_hash)
    @user_id = customer_hash.fetch("user_id") 
    @name = customer_hash.fetch("name") 
    @location = Location.new(customer_hash.fetch("latitude"), customer_hash.fetch("longitude")) 
  rescue Location::Error => ex
    raise ArgumentError.new("invalid location parameters")
  end
end
