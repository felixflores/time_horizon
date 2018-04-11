# frozen_string_literal: true

module TimeHorizon
  class User < DelegateClass(Credential)
    extend Forwardable
    def_delegators :person, :name, :email

    def self.find(id)
      new(Credential.find(id))
    end

    def self.find_by(**attrs)
      new(Credential.find_by(attrs))
    end

    def initialize(credential = Credential.new)
      super credential
    end

    def person
      @person ||= Person.find(person_id)
    end
  end
end
