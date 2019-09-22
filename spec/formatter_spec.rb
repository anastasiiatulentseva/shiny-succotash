require './spec/spec_helper'

RSpec.describe Formatter do
  
  it 'prints name and ids' do
    customer_1 = Customer.new(
      {"latitude"=> "53.270110", "user_id"=>100, "name"=>"31-17 Rochestown Park", "longitude"=>"-6.140827"}
    )
    customer_2 = Customer.new(
      {"latitude"=> "53.332265", "user_id"=>111, "name"=>"The Crescent Building", "longitude"=>"-6.377072"}
    )
    ostream = StringIO.new
    Formatter.new([customer_1, customer_2], ostream).format
    
    expect(ostream.tap(&:rewind).read).to eq <<~CSV
      100,31-17 Rochestown Park
      111,The Crescent Building
    CSV
  end
end
