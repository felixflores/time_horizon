# frozen_string_literal: true

module TimeHorizon
  class Eligiablity < DelegateClass(PriorAuthorization)
    def self.find(id)
      new(PriorAuthorization.find(id))
    end

    def initialize(pa = PriorAuthorization.new)
      super pa
    end

    def eligible?
      InsurancePolicy.is_member?(
        policy_number: policy_number,
        member_id: member_id
      )
    end

    def save
      super
      drug.save
    end
  end
end
