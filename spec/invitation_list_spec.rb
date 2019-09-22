require './spec/spec_helper'

RSpec.describe InvitationList do
  
  it 'does not return customers which are too far' do
    customer_1 = Customer.new(
      {"latitude"=> "53.270110", "user_id"=>100, "name"=>"31-17 Rochestown Park", "longitude"=>"-6.140827"}
    )
    customer_2 = Customer.new(
      {"latitude"=> "55.7539", "user_id"=>999, "name"=>"The Red Square", "longitude"=>"37.6208"}
    )
    customer_3 = Customer.new(
      {"latitude"=> "53.332265", "user_id"=>111, "name"=>"The Crescent Building", "longitude"=>"-6.377072"}
    )
    origin_location = Location.new(53.339428, -6.257664)
    invitation_list = InvitationList.new(
      customers: [customer_1, customer_2, customer_3], 
      range: 200, 
      origin_location: origin_location
    )
    expect(invitation_list.invitable_users).to match_array([customer_1, customer_3])
  end
end
