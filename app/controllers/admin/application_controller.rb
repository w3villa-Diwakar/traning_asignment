class Admin::ApplicationController < ApplicationController
	before_action :authenticate_user!
	before_action :admin_only
	layout 'admin_layout'

	private
	def admin_only
		if current_user.role.name != 'Admin'
			flash[:notice] = 'f off'
			redirect_to root_path
		end
	end
	
end