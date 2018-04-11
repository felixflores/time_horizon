# frozen_string_literal: true

module TimeHorizon
  class EligibilityCheck < DelegateClass(PriorAuthorization)
    def self.find(id)
      new(PriorAuthorization.find(id))
    end

    def initialize(pa = PriorAuthorization.new)
      super pa
    end

    def eligible?
      Services::InsurancePolicy.is_member?(
        policy_number: policy_number,
        member_id: insurance_number
      )
    end
  end
end
