# frozen_string_literal: true

module TimeHorizon
  class User < TransientDelegateClass(Credential)
    extend Forwardable
    def_delegators :person, :name, :email

    def initialize(credential = Credential.new)
      super credential
    end

    def person
      @person ||= Person.find(person_id)
    end
  end
end
