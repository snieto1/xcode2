class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]
  before_action :authorize_club, except: [:new, :create, :show, :index]
  before_action :authorize_user_or_club, only: [:show, :index]
  before_action :check_current_club, only: [:show, :edit]
    # GET /clubs
  # GET /clubs.json
  def index
    if current_user
      @clubs = Club.all
    elsif current_club
      # @club = Club.find(params[:id])
      redirect_to club_path(current_club)
    end
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
  end

  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs
  # POST /clubs.json
  def create
    @club = Club.new(club_params)

    # respond_to do |format|
    if @club.save
      # format.html { redirect_to @club, notice: 'Club was successfully created.' }
      # format.json { render :show, status: :created, location: @club }
      session[:club_id] = @club.id
      @current_club ||= Club.find(session[:club_id]) if session[:club_id]
      redirect_to club_path(@club)
    else
      # redirect_to '/signup'
      # flash[:notice] = "Club#create else statement"
      # format.html { render :new }
      # format.json { render json: @club.errors, status: :unprocessable_entity }
      render :new
    end
  end


  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: 'Club was successfully updated.' }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:club_name, :contact_person, :club_phone_number, :club_email, :password)
    end

    def authorize_user_or_club
      current_user || current_club
    end

    def check_current_club
      redirect_to current_club unless current_club == @club || current_user
    end
end
