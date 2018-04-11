# frozen_string_literal: true

module TimeHorizon
  class EligibilityCheck < TransientDelegateClass(PriorAuthorization)
    def eligible?
      Services::InsurancePolicy.is_member?(
        policy_number: policy_number,
        member_id: insurance_number
      )
    end
  end
end
