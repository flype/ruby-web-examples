module TodoHelper
  def todo_caption_class(todo)
    classes = ['caption']
    classes << 'done' if todo.done?
    classes.join(' ')
  end
end
