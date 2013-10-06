module ThingsTodo
  class TodoPresenter
    def initialize(todo)
      @todo = todo
    end

    def id
      todo.id
    end

    def text
      todo.text
    end

    def done?
      todo.done?
    end

    def pending?
      !done?
    end

    def caption_classes
      classes = ['caption']
      classes << 'done' if todo.done?
      classes.join(' ')
    end

    private

    attr_reader :todo
  end
end
