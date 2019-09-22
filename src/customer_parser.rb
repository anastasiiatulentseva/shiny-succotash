# frozen_string_literal: true

class CustomerParser
  MalformedInputFileError = Class.new(StandardError)

  def initialize(reader)
    @reader = reader
  end

  def parse
    reader.each_line.map do |customer_line|
      Customer.new(JSON.parse(customer_line))
    end
  rescue JSON::ParserError => e
    raise MalformedInputFileError, "Cannot create customer due to: #{e.message}"
  end

  private

  attr_reader :reader
end
