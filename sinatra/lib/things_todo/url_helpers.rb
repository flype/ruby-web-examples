module ThingsTodo
  module UrlHelpers
    def todos_path
      "/todos"
    end

    def todo_done_path(todo)
      "/todos/#{todo.id}/done"
    end
  end
end
