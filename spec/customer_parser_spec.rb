require './spec/spec_helper.rb'

RSpec.describe CustomerParser do
  subject { CustomerParser.new(StringIO.new(customer_json)).parse }
  
  let(:valid_json) { 
    <<-JSON
      {"latitude": "52.986375", "user_id": 12, "name": "Christina McArdle", "longitude": "-6.043701"}
      {"latitude": "51.92893", "user_id": 1, "name": "Alice Cahill", "longitude": "-10.27699"}
    JSON
  }
  
  context "valid list" do
    let(:customer_json) { valid_json }
    
    it 'creates customers objects' do
      subject.each do |element|
        expect(element).to be_a(Customer)
      end
    end
  end
  
  context "invalid list" do
    let(:customer_json) { valid_json << '{"latitude" => "51.92893", "user_id" => 1, "name" => "Alice Cahill", "longitude" => "-10.27699"}
' }
    
    it 'does not create customer from invalid json' do
      expect { subject }.to raise_error(CustomerParser::MalformedInputFileError)
    end 
  end
  
end
