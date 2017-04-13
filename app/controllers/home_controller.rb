class HomeController < ApplicationController
	def find_friends	
		@users = User.all.paginate(page: params[:page])
	end
end
