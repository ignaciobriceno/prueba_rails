class TodosController < ApplicationController
  before_action :authenticate_user!

  def index
  	@todos = Todo.all
	  @completos = []
	  @no_completos = []
	  @todos.each do |todo|
  		if todo.completed?
	   		@completos << todo 
		  else
			@no_completos << todo
		  end
	  end
  end

  def create
  	@tarea = Tarea.find(params[:tarea_id])
  	@todo = Todo.where(tarea_id: params[:tarea_id])
  	if @todo.compact[0].completed == true
  		@todo.compact[0].update_attribute :completed, false
  	else 
  		@todo.compact[0].update_attribute :completed, true
  	end
  	@todo.compact[0].save
  	redirect_to root_path		
  end

end
