require './spec/spec_helper.rb'

RSpec.describe DistanceCalculator do
  it 'has method .list' do
    expect(CustomerListGetter).to respond_to(:list)
  end
end
