class BasicController < ApplicationController
	def new
		@basic = Basic.new
	end

	def create
		@basic = Basic.new(basic_params)
		@basic.user_id = current_user.id
		@basic.save

		if @basic.save
			if current_user
				redirect_to user_dashboard_path(current_user.username)
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
    		redirect_to user_dashboard_path(current_user.username)
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
