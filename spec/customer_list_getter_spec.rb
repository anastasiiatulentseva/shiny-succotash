# run with `ruby spec/customer_list_getter_spec.rb`
require './spec/spec_helper'

RSpec.describe CustomerListGetter do
  it 'has method .list' do
    expect(CustomerListGetter).to respond_to(:list)
  end
end
