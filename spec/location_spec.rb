require './spec/spec_helper.rb'

RSpec.describe Location do
  it 'returns location' do
    location = Location.new('59.9398', '30.3146')
    expect(location.latitude).to eq(59.9398)
    expect(location.longitude).to eq(30.3146)
  end
  
  it 'does not accept nil for latitude' do
    expect{ Location.new(nil, 30.3146) }.to raise_error(Location::Error)
  end
  
  it 'does not accept nil for latitude' do
    expect{ Location.new(59.9398, nil) }.to raise_error(Location::Error)
  end
  
  it 'does not accept invalid floats for latitude' do
    expect{ Location.new("invalid_value", 30.3146) }.to raise_error(Location::Error)
  end
  
  it 'does not accept invalid floats for latitude' do
    expect{ Location.new(59.9398, "invalid_value") }.to raise_error(Location::Error)
  end
  
  it 'raises error if latitude is out of range' do
    expect{ Location.new(190.34343, 30.3146) }.to raise_error(Location::InvalidRangeError)
  end
  
  it 'raises error if longitude is out of range' do
    expect{ Location.new(59.9398, -230.5803) }.to raise_error(Location::InvalidRangeError)
  end
end