class TodosController < ApplicationController
  respond_to :html

  def index
    @todos = Todo.order('created_at desc').all
  end

  def create
    @todo = Todo.create todo_params
    respond_with @todo, :location => todos_path
  end

  def done
    @todo = Todo.find(params[:id])
    @todo.done!
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:text)
  end
end
