# frozen_string_literal: true

module TimeHorizon
  class Form < TransientDelegateClass(PriorAuthorization)
    def drug
      @drug ||= Drug.find(drug_id)
    end

    def complete?
      attributes.all? do |attr|
        !send(attr).nil? || send(attr) != ''
      end
    end

    def save
      return false unless complete?

      super
      drug.save
    end
  end
end
