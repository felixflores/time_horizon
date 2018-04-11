require "spec_helper"

module TimeHorizon
  RSpec.describe 'Delegation Example 3' do
    let(:pa) do
      PriorAuthorization.new(
        name: 'Felix Flores',
        address: '123 Abc Ave.',
        carrier: 'Aetna',
        insurance_number: '1234',
        policy_number: '123456'
      ).save
    end

    let(:review) do
      Review.new(prior_authorization_id: pa.id).save
    end

    it 'playground' do
      determination = Determination.find(review.id)

      expect(determination.form).to be_a(Form)
      expect(determination.eligibility).to be_a(EligibilityCheck)
    end
  end
end
