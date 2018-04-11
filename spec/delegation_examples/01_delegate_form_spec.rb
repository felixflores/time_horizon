require "spec_helper"

module TimeHorizon
  RSpec.describe 'Delegation Example 1' do
    let(:drug) do
      Drug.new(
        name: 'Celebrate',
        description: 'Good for you.'
      ).save
    end

    let!(:pa) do
      PriorAuthorization.new(
        address: '123 Abc Ave.',
        carrier: 'Aetna',
        drug_id: drug.id,
        name: 'Felix Flores'
      ).save
    end

    it 'playground' do
      form = Form.find(pa.id)

      expect(form.name).to eq('Felix Flores')
      expect(form).to be_complete
      expect { pa.complete? }.to raise_error(NoMethodError)
    end
  end
end
