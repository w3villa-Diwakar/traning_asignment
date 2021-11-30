class Admin::DashboardsController < Admin::ApplicationController
	def index
	
	end
	def posts
		@posts = Post.all
	end
	def events
		@events = Event.all
	end
	def images
		@images = Image.all
	end

end