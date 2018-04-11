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

    it 'can find the form using find' do
      eligibility = EligibilityCheck.find(pa.id)

      expect(eligibility.name).to eq('Felix Flores')
      expect(eligibility).to be_eligible
    end
  end
end
