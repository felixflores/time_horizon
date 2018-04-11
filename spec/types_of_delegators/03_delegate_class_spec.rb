require "spec_helper"

class DelegateClassThing < DelegateClass(Array)
end

RSpec.describe 'delegate class' do
  it 'can use DelegateClass method for other things' do
    delegate = DelegateClassThing.new([])

    delegate << 1
    expect(delegate).to eq([1])
  end
end
