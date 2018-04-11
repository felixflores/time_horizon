# frozen_string_literal: true

module TimeHorizon
  class Determination < TransientDelegateClass(Review)
    def self.from_prior_authorization(pa)
      if pa.is_a?(PriorAuthorization)
        pa
      else
        PriorAuthorization.find(pa)
      end
    end

    def form
      @form ||= Form.new(prior_authorization.id)
    end

    def eligibility
      @elibility ||= EligibilityCheck.new(prior_authorization.id)
    end

    private

    def prior_authorization
      @prior_authorization ||= PriorAuthorization.find(prior_authorization_id)
    end
  end
end
