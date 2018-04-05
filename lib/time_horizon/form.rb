# frozen_string_literal: true

module TimeHorizon
  class Form < DelegateClass(PriorAuthorization)
    def self.find(id)
      new(PriorAuthorization.find(id))
    end

    def initialize(pa = PriorAuthorization.new)
      super pa
    end

    def drug
      @drug ||= Drug.find(drug_id)
    end

    def complete?
      attributes.all do |attr|
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
