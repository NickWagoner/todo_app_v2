class TodosController < ApplicationController
  
	def index
		@todo_items = Todo.all
		@new_todo = Todo.new
	end

	def add
		todo = Todo.create(:todo_item => params[:todo][:todo_item])

			unless todo.valid?
				flash[:error] = todo.errors.full_messages.join("<br>").html_safe
			else
				flash[:success] = "Todo added succesfully"
			end

		redirect_to :action => 'index'
	end

	# This is the "Complete Todos" strikethrough 
	# feature w/ the ability to toggle:

		def complete
			params[:todos_checkbox].each do |check|
				todo_id = check
				t = Todo.find_by_id(todo_id)

				if t.completed == false
					t.update_attribute(:completed, true)
				else
					t.update_attribute(:completed, false)
				end
			end
			redirect_to :action => "index"
		end

	# This is the "Complete Todos" strikethrough 
	# feature w/o the ability to toggle:

		#def complete
			#params[:todos_checkbox].each do |check|
				#todo_id = check

				#t = Todo.find_by_id(todo_id)
				#t.update_attribute(:completed, true)
			#end
			#redirect_to :action => "index"
		#end
  
end
