require "spec_helper"

class DelegatedThing < Delegator
  def __getobj__
    @obj
  end

  def __setobj__(obj)
    @obj = obj
 end
end

RSpec.describe 'delegator' do
  it 'requires object for delegation during initialization' do
    delegate = DelegatedThing.new([])

    delegate << 1
    expect(delegate).to eq([1])
  end
end
