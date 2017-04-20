class DareRoomsController < ApplicationController
	before_action :set_userdare, only: [:show, :edit, :update, :destroy]

	def index
		#display dares created and rx'd only by the logged in user
		@dare_rooms = DareRoom.all.where('sent_from_id IN (?) OR sent_to_id IN (?)', current_user.id, current_user.id)
		@users = User.all
	end

	def new 
		@dare_room = DareRoom.new
		@users = User.all
	end

	def create
		@dare_room = current_user.dare_rooms.build(dare_room_params)
		@dare_room.sent_from_id = current_user.id

		if @dare_room.save
			flash[:success] = "Dare room added"
			redirect_to dare_rooms_path
		else
			render 'new'
		end
	end

	def show
		@userdare = DareRoom.find(params[:id])
		#get rx and sx users and place in variables to display names etc.
		@to_user = User.find(@userdare.sent_to_id)
		@from_user = User.find(@userdare.sent_from_id)
	end

	def set_to_accepted
		@userdare = DareRoom.find(params[:id])
		@userdare.accept_dare!
		redirect_to @userdare
	end

	def set_to_declined
		@userdare = DareRoom.find(params[:id])
		@userdare.decline_dare!
		redirect_to @userdare
	end

	private

	def set_userdare
      @userdare = DareRoom.find(params[:id])
    end

	def dare_room_params
		params.require(:dare_room).permit(:title, :sent_to_id)
	end
end