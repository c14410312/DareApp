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
		current_user.deduct_coins(@dare_room.coins) #call deduct coins function

		if @dare_room.save
			flash[:success] = "Dare room added"
			redirect_to dare_rooms_path
		else
			render 'new'
		end
	end

	def update
      if @userdare.update_attributes(dare_room_params)
        redirect_to @userdare, notice: 'Proof uploaded successfully'
      else
        redirect_to @userdare, notice: 'Proof upload unsuccessful'
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

	def set_to_approved
		@userdare = DareRoom.find(params[:id])
		@user = User.find(@userdare.sent_to_id)
		@userdare.approve_proof!
		@user.lodge_coins(@userdare.coins) #adds the coins to the user when dare approved
		redirect_to @userdare
	end

	def set_to_unapproved
		@userdare = DareRoom.find(params[:id])
		@userdare.unapprove_proof!
		redirect_to @userdare
	end

	def set_to_public
		@userdare = DareRoom.find(params[:id])
		@userdare.public_proof!
		redirect_to @userdare
	end

	def set_to_private
		@userdare = DareRoom.find(params[:id])
		@userdare.private_proof!
		redirect_to @userdare
	end

	private

	def set_userdare
      @userdare = DareRoom.find(params[:id])
    end

	def dare_room_params
		params.require(:dare_room).permit(:title, :sent_to_id, :sent_from_id, :proof, :coins)
	end
end