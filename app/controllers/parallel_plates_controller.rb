class ParallelPlatesController < ApplicationController
  before_action :set_parallel_plate, only: [:show, :edit, :update, :destroy]

  # GET /parallel_plates
  # GET /parallel_plates.json
  def index
    @parallel_plates = ParallelPlate.all
  end

  # GET /parallel_plates/1
  # GET /parallel_plates/1.json
  def show
  end

  # GET /parallel_plates/new
  def new
    @parallel_plate = ParallelPlate.new
  end

  # GET /parallel_plates/1/edit
  def edit
  end

  # POST /parallel_plates
  # POST /parallel_plates.json
  def create
    @parallel_plate = ParallelPlate.new(parallel_plate_params)

    respond_to do |format|
      if @parallel_plate.save
        format.html { redirect_to @parallel_plate, notice: 'Parallel plate was successfully created.' }
        format.json { render :show, status: :created, location: @parallel_plate }
      else
        format.html { render :new }
        format.json { render json: @parallel_plate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parallel_plates/1
  # PATCH/PUT /parallel_plates/1.json
  def update
    respond_to do |format|
      if @parallel_plate.update(parallel_plate_params)
        format.html { redirect_to @parallel_plate, notice: 'Parallel plate was successfully updated.' }
        format.json { render :show, status: :ok, location: @parallel_plate }
      else
        format.html { render :edit }
        format.json { render json: @parallel_plate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parallel_plates/1
  # DELETE /parallel_plates/1.json
  def destroy
    @parallel_plate.destroy
    respond_to do |format|
      format.html { redirect_to parallel_plates_url, notice: 'Parallel plate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parallel_plate
      @parallel_plate = ParallelPlate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parallel_plate_params
      params.require(:parallel_plate).permit(:height)
    end
end
