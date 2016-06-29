class BasePlatesController < ApplicationController
  before_action :set_base_plate, only: [:show, :edit, :update, :destroy]

  # GET /base_plates
  # GET /base_plates.json
  def index
    @base_plates = BasePlate.all
  end

  # GET /base_plates/1
  # GET /base_plates/1.json
  def show
  end

  # GET /base_plates/new
  def new
    @base_plate = BasePlate.new
  end

  # GET /base_plates/1/edit
  def edit
  end

  # POST /base_plates
  # POST /base_plates.json
  def create
    @base_plate = BasePlate.new(base_plate_params)

    respond_to do |format|
      if @base_plate.save
        format.html { redirect_to @base_plate, notice: 'Base plate was successfully created.' }
        format.json { render :show, status: :created, location: @base_plate }
      else
        format.html { render :new }
        format.json { render json: @base_plate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /base_plates/1
  # PATCH/PUT /base_plates/1.json
  def update
    respond_to do |format|
      if @base_plate.update(base_plate_params)
        format.html { redirect_to @base_plate, notice: 'Base plate was successfully updated.' }
        format.json { render :show, status: :ok, location: @base_plate }
      else
        format.html { render :edit }
        format.json { render json: @base_plate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /base_plates/1
  # DELETE /base_plates/1.json
  def destroy
    @base_plate.destroy
    respond_to do |format|
      format.html { redirect_to base_plates_url, notice: 'Base plate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_base_plate
      @base_plate = BasePlate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def base_plate_params
      params.require(:base_plate).permit(:height)
    end
end
