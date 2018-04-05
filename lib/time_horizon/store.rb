# frozen_string_literal: true

require 'singleton'

module TimeHorizon
  class Store
    include Singleton

    class << self
      extend Forwardable
      def_delegators :instance, :table
    end

    def initialize
      @store = {}
    end

    def table(table_name)
      @store[table_name] ||= {}
      @store[table_name]
    end
  end
end
