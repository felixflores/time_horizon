require "spec_helper"

class SimpleDelegatedThing < SimpleDelegator
end

RSpec.describe 'delegator' do
  it 'requires object for delegation during initialization' do
    delegate = SimpleDelegatedThing.new([])

    delegate << 1
    expect(delegate).to eq([1])
  end
end
