class TareasController < ApplicationController
  def index
  	@tareas = Tarea.all
  	@todos = current_user.todos
  end
  def show
  	@tarea = Tarea.find(params[:id])
  	@last = @tarea.todos.order('updated_at DESC').first(5)
  	@usuarios = @tarea.todos
  end
end
