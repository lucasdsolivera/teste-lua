class Comment < ActiveRecord::Base

	has_many :comment_children, foreign_key: :created_by_comment_id, class_name: "Comment"
	
end
