class CommentsController < ApplicationController

	def index
		@comments= Comment.all.paginate(:page => params[:page], :per_page => 5)
	end

	def create(comment)

	end
end
