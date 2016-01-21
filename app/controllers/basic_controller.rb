class BasicController < ApplicationController
	before_action :authenticate_user!, only: [:edit, :update]
	def new
		@basic = Basic.new
	end

	def create
		@basic = Basic.new(basic_params)
		@basic.user_id = current_user.id
		@basic.save

		if @basic.save
			if current_user
				@user_status = current_user.basic
				flash[:notice] = "Profile successfully created"
				redirect_to user_dashboard_path(username: current_user.username, user_status: @user_status)
			else
				redirect_to root_path
			end
		else
			render 'new'
		end
	end

	def edit
		if current_user.basic
			@basic = Basic.find(current_user.basic)
		else
			@basic = Basic.new
		end
	end

	def update
		@basic = current_user.basic
		if @basic.update(basic_params)
			flash[:notice] = "Update successfully created"
    		redirect_to user_dashboard_path(username: current_user.username)
    	else
      		render 'edit'
    	end	
	end

	private

	def basic_params
		params.require(:basic).permit(:id, :full_name, :phone, :linkedin, :twitter, :skype, :personal_website, 
			educations_attributes: [:id, :degree, :college, :location, :yop, :gpa, :_destroy], 
			projects_attributes: [:id, :title, :description, :_destroy], 
			experiences_attributes: [:id, :company, :location, :duration, :role, :description, :_destroy], 
			skills_attributes: [:id, :skill, :_destroy])
	end
end
