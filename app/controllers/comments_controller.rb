class CommentsController < ApplicationController

	include CommentHelper
	skip_before_action :verify_authenticity_token

	def index
		@comments = Comment.where(parent:nil).paginate(:page => params[:page], :per_page => 5)
	end

	def create
		 message = CommentHelper.validate_message(params[:message], BlockedWord.pluck(:word))
		 @comment = Comment.new(message: message, comment_id: params[:comment_id])
 
  		 @comment.save
  		 redirect_to Comment.find(@comment.get_first_parent.id)
	end

	def show
		@comment = Comment.find(params[:id])
		@comment_children_list = Comment.where(comment_id: @comment.id).paginate(:page => params[:page], :per_page => 5)
	end
end
