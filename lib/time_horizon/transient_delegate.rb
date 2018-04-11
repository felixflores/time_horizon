# frozen_string_literal: true

def TransientDelegateClass(superclass)
  klass = DelegateClass(superclass)

  klass.define_singleton_method :superclass do
    superclass
  end

  klass.define_singleton_method :find do |id|
    new(superclass.find(id))
  end

  klass.define_singleton_method :find_by do |**attrs|
    new(superclass.find_by(attrs))
  end

  klass.define_singleton_method :from do |instance|
    target = instance.is_a?(superclass) ? instance : instance.__getobj__

    unless target.is_a?(superclass)
      raise "Cannot delegate create #{self.class} from #{target.class}"
    end

    new(target)
  end

  klass.module_eval do
    def initialize(obj = nil)
      super obj || self.class.superclass.new
    end
  end

  klass
end
