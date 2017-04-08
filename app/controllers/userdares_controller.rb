class UserdaresController < ApplicationController
  before_action :set_userdare, only: [:show, :edit, :update, :destroy]

  # GET /userdares
  # GET /userdares.json
  def index
    @userdares = Userdare.all
  end

  # GET /userdares/1
  # GET /userdares/1.json
  def show
  end

  # GET /userdares/new
  def new
    @userdare = Userdare.new
  end

  # GET /userdares/1/edit
  def edit
  end

  # POST /userdares
  # POST /userdares.json
  def create
    @userdare = Userdare.new(userdare_params)

    respond_to do |format|
      if @userdare.save
        format.html { redirect_to @userdare, notice: 'Userdare was successfully created.' }
        format.json { render :show, status: :created, location: @userdare }
      else
        format.html { render :new }
        format.json { render json: @userdare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userdares/1
  # PATCH/PUT /userdares/1.json
  def update
    respond_to do |format|
      if @userdare.update(userdare_params)
        format.html { redirect_to @userdare, notice: 'Userdare was successfully updated.' }
        format.json { render :show, status: :ok, location: @userdare }
      else
        format.html { render :edit }
        format.json { render json: @userdare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userdares/1
  # DELETE /userdares/1.json
  def destroy
    @userdare.destroy
    respond_to do |format|
      format.html { redirect_to userdares_url, notice: 'Userdare was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userdare
      @userdare = Userdare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userdare_params
      params.require(:userdare).permit(:name, :user_id)
    end
end
