class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy]

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def index
    @tools = Tool.all
  end
  
  def show
  end

  def tool_params
    params.require(:tool).permit(:length,
                                 :material,
                                 :diameter,
                                 :numFlutes)
  end


  def create
    @tool = Tool.new(tool_params)

    respond_to do |format|
      if @tool.save
        format.html { redirect_to @tool, notice: 'Tool was successfully created.' }
        format.json { render :show, status: :created, location: @tool }
      else
        format.html { render :new }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

end
