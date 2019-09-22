# frozen_string_literal: true

require_relative 'location.rb'

class InvitationList
  DUBLIN_OFFICE = ::Location.new(53.339428, -6.257664)

  def initialize(customers:, range:, origin_location: nil)
    @customers = customers
    @range = range
    @origin_location = origin_location || DUBLIN_OFFICE
  end

  def invitable_users
    customers.select do |customer|
      customer.location.distance_from(DUBLIN_OFFICE) <= range
    end.sort_by(&:user_id)
  end

  private

  attr_reader :customers, :range, :origin_location
end
