class UserController < ApplicationController
	def index
		if current_user
			@current_user = current_user
			redirect_to user_dashboard_path(@current_user.username)
		end
	end

	def dashboard
		@current_user = current_user
	end
end
