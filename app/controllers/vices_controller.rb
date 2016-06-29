class VicesController < ApplicationController
  before_action :set_vice, only: [:show, :edit, :update, :destroy]

  # GET /vices
  # GET /vices.json
  def index
    @vices = Vice.all
  end

  # GET /vices/1
  # GET /vices/1.json
  def show
  end

  # GET /vices/new
  def new
    @vice = Vice.new
  end

  # GET /vices/1/edit
  def edit
  end

  # POST /vices
  # POST /vices.json
  def create
    @vice = Vice.new(vice_params)

    respond_to do |format|
      if @vice.save
        format.html { redirect_to @vice, notice: 'Vice was successfully created.' }
        format.json { render :show, status: :created, location: @vice }
      else
        format.html { render :new }
        format.json { render json: @vice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vices/1
  # PATCH/PUT /vices/1.json
  def update
    respond_to do |format|
      if @vice.update(vice_params)
        format.html { redirect_to @vice, notice: 'Vice was successfully updated.' }
        format.json { render :show, status: :ok, location: @vice }
      else
        format.html { render :edit }
        format.json { render json: @vice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vices/1
  # DELETE /vices/1.json
  def destroy
    @vice.destroy
    respond_to do |format|
      format.html { redirect_to vices_url, notice: 'Vice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vice
      @vice = Vice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vice_params
      params.require(:vice).permit(:xPos, :yPos, :zPos, :xLength, :yLength, :baseHeight, :topHeight, :clampWidth, :maxJawWidth, :protectiveBasePlateHeight)
    end
end
