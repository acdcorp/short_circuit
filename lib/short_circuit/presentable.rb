module ShortCircuit
  module Presentable
    def presenter
      @presenter ||= find_presenter
    end

    def present(method, *args, &block)
      present!(method, *args, &block)
    end

    def present!(method, *args, &block)
      presenter.send(method, *args, &block)
    end

    private

    def find_presenter
      presenter_class_name = "#{self.class.name}Presenter"
      presenter_class = Object.const_get(presenter_class_name)

      presenter_class.new(self)
    end
  end
end
