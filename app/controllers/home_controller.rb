class HomeController < ApplicationController
	def index
		#get all user dares
		@dares = DareRoom.all.where('publish_proof IN (?)', true)
		@dares.sort_by { |m| [m.created_at, m.updated_at].max }.reverse!
	end

	def find_friends	
		@users = User.all.paginate(page: params[:page])
	end
end
