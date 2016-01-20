class UserController < ApplicationController
	def index
		if current_user
			@current_user = current_user
			flash[:notice] = "Signed in successfully"
			redirect_to user_dashboard_path(@current_user.username)
		end
	end

	def dashboard
		@current_user = current_user
		if params[:username] != current_user.username
			render 'page_not_found'
		else
			if current_user.basic.nil?
				@status = false
			else
				@status = true
			end
		end
	end
end
