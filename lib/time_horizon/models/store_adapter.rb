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
      attr = Store.table(table)[id]
      new(id: id, **attr)
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

      @id ||= self.class.next_id
      current_value = Store.table(self.class.table)[@id] || {}
      Store.table(self.class.table)[@id] = current_value.merge(data)
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
