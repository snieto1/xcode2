class TablesController < ApplicationController
  before_action :set_table, only: [:show, :edit, :update, :destroy]

  # GET /tables
  # GET /tables.json
  def index
    @tables = Table.all
  end

  # GET /tables/1
  # GET /tables/1.json
  def show
  end

  # GET /tables/new
  def new
    @club = Club.find(params[:club_id])
    @table = Table.new
    # @table = @club.tables.create
  end

  # GET /tables/1/edit
  def edit
  end

  # POST /tables
  # POST /tables.json
  def create
    @club = Club.find(params[:club_id])
    @table = @club.tables.create!(table_params)
    redirect_to club_path(@club)
    # @comment = @article.comments.create(comment_params)
    #
    # respond_to do |format|
    #   if @table.save
    #     format.html { redirect_to @table, notice: 'Table was successfully created.' }
    #     format.json { render :show, status: :created, location: @table }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @table.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /tables/1
  # PATCH/PUT /tables/1.json
  def update
    @club = Club.find_by(params[:club_id])
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to club_path(@club), notice: 'Table was successfully updated.' }
        format.json { render :show, status: :ok, location: @table }
      else
        format.html { render :edit }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json
  def destroy
    @club = Club.find(params[:club_id])
    @table.destroy
    respond_to do |format|
      format.html { redirect_to club_path(@club), notice: 'Table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_params
      params.require(:table).permit(:table_name, :minimum)
    end
end
