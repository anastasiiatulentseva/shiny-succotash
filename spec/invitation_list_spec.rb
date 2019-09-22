# frozen_string_literal: true

require './spec/spec_helper'

RSpec.describe InvitationList do
  it 'does not return customers which are too far' do
    customer1 = Customer.new(
      'latitude' => '53.270110', 'user_id' => 100, 'name' => '31-17 Rochestown Park', 'longitude' => '-6.140827'
    )
    customer2 = Customer.new(
      'latitude' => '55.7539', 'user_id' => 999, 'name' => 'The Red Square', 'longitude' => '37.6208'
    )
    customer3 = Customer.new(
      'latitude' => '53.332265', 'user_id' => 111, 'name' => 'The Crescent Building', 'longitude' => '-6.377072'
    )
    origin_location = Location.new(53.339428, -6.257664)
    invitation_list = InvitationList.new(
      customers: [customer1, customer2, customer3],
      range: 200,
      origin_location: origin_location
    )
    expect(invitation_list.invitable_users).to match_array([customer1, customer3])
  end
end
