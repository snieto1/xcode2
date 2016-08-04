class BottlesController < ApplicationController
  before_action :set_bottle, only: [:show, :edit, :update, :destroy]

def index
  @bottles = Bottle.all
end

def show
end

def new
  @club = Club.find(params[:club_id])
  @bottle = Bottle.new
end

def edit
end

def create
  @club = Club.find(params[:club_id])
  @bottle = @club.bottles.create!(bottle_params)
  redirect_to club_path(@club)
end

def update
  @club = Club.find_by(params[:club_id])
  respond_to do |format|
    if @bottle.update(bottle_params)
      format.html { redirect_to club_path(@club), notice: 'Table was successfully updated.' }
      format.json { render :show, status: :ok, location: @bottle }
    else
      format.html { render :edit }
      format.json { render json: @bottle.errors, status: :unprocessable_entity }
    end
  end
end

  def destroy
    @club = Club.find(params[:club_id])
    @bottle.destroy
    respond_to do |format|
      format.html { redirect_to club_path(@club), notice: 'Bottle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bottle
      @bottle = Bottle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bottle_params
      params.require(:bottle).permit(:name, :price)
    end
end
