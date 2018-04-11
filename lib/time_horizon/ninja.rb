# frozen_string_literal: true

module TimeHorizon
  class Ninja < TransientDelegateClass(Person)
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
