# require './customer_list_getter.rb'
# require './distance_calculator.rb'

class InvitationListMaker
  def initialize(users:, range:)
    @users = users
    @range = range
  end
  
  def invitable_users
    list = users.select do |customer|
      # customer.location.latitude
      DistanceCalculator.new(customer["latitude"], customer["longitude"]).distance_from_office <= range
    end
    list.sort_by {|line| line['user_id']}.map {|line| [line["user_id"], line["name"]]}
  end
    
  
  private
  
  attr_reader :users, :range
end


p InvitationListMaker.new(users: CustomerListGetter.list, range: 100).invitable_users
