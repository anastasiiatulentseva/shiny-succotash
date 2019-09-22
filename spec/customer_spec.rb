# frozen_string_literal: true

require './spec/spec_helper.rb'

RSpec.describe Customer do
  subject { Customer.new(customer_params) }
  let(:valid_params) { { 'latitude' => '59.9398', 'user_id' => 999, 'name' => 'Hermitage', 'longitude' => '30.3146' } }

  context 'valid params' do
    let(:customer_params) { valid_params }

    it { is_expected.to respond_to(:user_id) }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:location) }
  end

  context 'invalid location' do
    let(:customer_params) { valid_params.merge('longitude' => nil) }

    it 'does not create a customer with invalid location' do
      expect { subject }.to raise_error(ArgumentError)
    end
  end
end
