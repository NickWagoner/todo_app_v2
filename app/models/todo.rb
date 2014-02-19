class Todo < ActiveRecord::Base
	
	include ActiveModel::ForbiddenAttributesProtection
	validates :todo_item, presence: true
	
end
