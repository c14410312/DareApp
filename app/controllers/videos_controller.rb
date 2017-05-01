class VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_video, only: [:show, :edit]

  # All published videos
  def index
    @videos = Video.where(published: true)
  end

  def show
  end

  def new
    @video = Video.new(:dareroom_id => params[:dareroom_id])
  end

  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:video_file, :name, :dareroom_id)
  end
end
