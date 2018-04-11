# frozen_string_literal: true

module TimeHorizon
  class Ninja < DelegateClass(Person)
    def self.from(maybe_person)
      if maybe_person.is_a?(Person)
        new(maybe_person)
      else
        new(maybe_person.__getobj__)
      end
    end

    def initialize(person)
      user = User.find_by(person_id: person.id)
      raise "can't be a ninja" if !user || user.role != 'developer'

      super person
    end

    def agile?
      true
    end
  end
end
