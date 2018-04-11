# frozen_string_literal: true

module TimeHorizon
  class Determination < DelegateClass(Review)
    def self.find(id)
      new(Review.find(id))
    end

    def self.from_prior_authorization(pa)
      if pa.is_a?(PriorAuthorization)
        pa
      else
        PriorAuthorization.find(pa)
      end
    end

    def initialize(review = Review.new)
      super review
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
