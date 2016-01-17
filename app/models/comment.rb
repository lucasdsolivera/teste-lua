class Comment < ActiveRecord::Base

	belongs_to :parent, class_name: "Comment", foreign_key: "comment_id"
	has_many :children, class_name: "Comment", foreign_key: "comment_id"
	  
	def get_first_parent
		if parent.nil? 
			return self
		else
			return parent.get_first_parent()
		end
	end
end
