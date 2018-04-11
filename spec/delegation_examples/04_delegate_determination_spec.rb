require "spec_helper"

module TimeHorizon
  RSpec.describe 'Delegation Example 4' do
    let(:person) do
      Person.new(
        name: 'Felix Flores',
        email: 'fflores@covermymeds.com'
      ).save
    end

    let!(:credential) do
      Credential.new(
        role: 'developer',
        person_id: person.id
      ).save
    end

    it 'playground' do
      user = User.find(credential.id)

      expect(user.role).to eq('developer')
      expect(user.email).to eq('fflores@covermymeds.com')
      expect(user.name).to eq('Felix Flores')
      expect(user.person).to be_a(Person)
    end

    it 'ninja' do
      ninja = Ninja.from(person)
      expect(ninja).to be_agile
    end
  end
end
