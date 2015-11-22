class TodosController < ApplicationController

	before_action :find_todo, only: [:show, :destroy, :edit, :update]

	def index 
		@todos = Todo.order(:title)
	end

	def show 
	end

	def new 
		@todo = Todo.new
	end

	def create
		@todo = Todo.create(todo_params)
		redirect_to action: :index
	end

	def destroy
		@todo.destroy
		redirect_to action: :index
	end

	def edit
	end

	def update
		@todo.update_attributes(todo_params)
		redirect_to action: :index
	end

	private

	def find_todo
		@todo = Todo.find(params[:id]) 
	end

	def todo_params		
		params.require(:todo).permit(:title, :content)
	end

end


