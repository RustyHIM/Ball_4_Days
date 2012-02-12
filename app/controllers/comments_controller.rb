class CommentsController < ApplicationController
	before_filter :authenticate
	
	def create
		@user = User.find(params[:comment][:goer_id])
		current_user.attend!(@user)
		redirect_to(:back)
	end
	
	
end