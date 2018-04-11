# frozen_string_literal: true

module TimeHorizon
  class StoreAdapter
    attr_accessor :id

    def self.table(table_name = nil)
      @table_name ||= table_name
      @table_name
    end

    def self.schema(*attributes)
      @attributes = attributes

      attributes.each do |attribute|
        attr_accessor attribute
      end
    end

    def self.find(id)
      find_by(id: id)
    end

    def self.find_by(**matchers)
      attrs = Store.table(table).detect do |record|
        (matchers.to_a - record.to_a).empty?
      end

      new(attrs) if attrs
    end

    def self.attributes
      @attributes
    end

    def initialize(attrs = {})
      [:id, *attributes].each do |attr|
        send("#{attr}=", attrs[attr])
      end
    end

    def save
      data = attributes.each_with_object({}) do |attr, d|
        d[attr] = send(attr)
      end

      if id
        existing_record = self.class.find(id)
        existing_record.merge!(data)
      else
        @id ||= self.class.next_id
        Store.table(self.class.table) << { id: @id, **data }
      end

      self
    end

    def attributes
      self.class.attributes
    end

    private

    def self.next_id
      @id ||= 0
      @id += 1
    end
  end
end
