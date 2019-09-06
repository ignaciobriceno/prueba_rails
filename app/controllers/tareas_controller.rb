class TareasController < ApplicationController
  def index
  	@tareas = Tarea.all
  	@todos = Todo.all
  end
end
