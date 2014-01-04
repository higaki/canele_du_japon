class CanelesController < ApplicationController
  before_action :set_canele, only: [:show, :edit, :update, :destroy]

  # GET /caneles
  # GET /caneles.json
  def index
    @caneles = Canele.all
  end

  # GET /caneles/1
  # GET /caneles/1.json
  def show
  end

  # GET /caneles/new
  def new
    @canele = Canele.new
  end

  # GET /caneles/1/edit
  def edit
  end

  # POST /caneles
  # POST /caneles.json
  def create
    @canele = Canele.new(canele_params)

    respond_to do |format|
      if @canele.save
        format.html { redirect_to @canele, notice: 'Canele was successfully created.' }
        format.json { render action: 'show', status: :created, location: @canele }
      else
        format.html { render action: 'new' }
        format.json { render json: @canele.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caneles/1
  # PATCH/PUT /caneles/1.json
  def update
    respond_to do |format|
      if @canele.update(canele_params)
        format.html { redirect_to @canele, notice: 'Canele was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @canele.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caneles/1
  # DELETE /caneles/1.json
  def destroy
    @canele.destroy
    respond_to do |format|
      format.html { redirect_to caneles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_canele
      @canele = Canele.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def canele_params
      params.require(:canele).permit(:name, :price, :started_from, :discontinued_in)
    end
end
