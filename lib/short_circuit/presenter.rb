# require 'delegate'

module ShortCircuit
  class Presenter < SimpleDelegator
    def initialize(presentable_object)
      instance_variable_set(
        "@#{presentable_object.class.to_s.gsub(/.+::/, '').underscore}",
        presentable_object)

      super(presentable_object)
    end

    # Ignore missing presenter methods
    def error_response(error, method, *args, &block)
      ''
    end
  end
end
