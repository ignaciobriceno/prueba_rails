class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :load_todos
  has_many :todos
  has_many :tareas, through: :todos       
end

def load_todos
	Tarea.all.each do |tarea|
		@todo = Todo.new(tarea_id: tarea.id, user_id: self.id)
		@todo.save
	end
end