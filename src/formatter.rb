# frozen_string_literal: true

class Formatter
  def initialize(customer_list, ostream = STDOUT)
    @customer_list = customer_list
    @ostream = ostream
  end

  def format
    customer_list.each do |customer|
      ostream.puts "#{customer.user_id},#{customer.name}"
    end
  end

  private

  attr_reader :ostream, :customer_list
end
