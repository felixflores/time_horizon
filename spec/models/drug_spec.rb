require 'spec_helper'

RSpec.describe TimeHorizon::Drug do
  let(:subject) do
    described_class.new(
      name: 'Celebrate',
      description: 'Makes you feel like a million bucks.'
    )
  end

  it 'acts kind of like an active record object' do
    expect(subject.name).to eq('Celebrate')
    expect(subject.description).to eq('Makes you feel like a million bucks.')
  end

  it 'can be save and retrived' do
    expect(subject.id).to eq(nil)
    subject.save
    expect(subject.id).to be_a(Integer)

    drug = described_class.find(subject.id)
    expect(drug.name).to eq('Celebrate')
  end
end
