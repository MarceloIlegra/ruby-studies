class TodosController < ApplicationController

	def index 
		@todos = Todo.all
	end

	def show 
		@todo = Todo.find(params[:id])
	end

	def new 
		@todo = Todo.new
	end

	def create
		@todo = Todo.create(todo_params)
		redirect_to action: :index
	end

	private

	def todo_params
		params.require(:todo).permit(:title, :content)
	end

end


