require "spec_helper"

module TimeHorizon
  RSpec.describe 'Delegation Example 2' do
    let!(:pa) do
      PriorAuthorization.new(
        name: 'Felix Flores',
        address: '123 Abc Ave.',
        carrier: 'Aetna',
        insurance_number: '1234',
        policy_number: '123456'
      ).save
    end
  end
end
