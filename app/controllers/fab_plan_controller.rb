class FabPlanController < ApplicationController
  def create
  end

  def view
  end

  def download
    # TODO: Add code to call json-plan and build the resulting fabrication
    # plan
    stl_path = @upload_path
    inputs_path = File.join(Rails.root, 'app', 'inputs', 'inputs.json')
    output_path = File.join(Rails.root, 'app', 'plans', 'final_plan.json')
    plan_path = File.join(Rails.root, 'app', 'execs', 'json-plan')
    
    f = File.read(output_path)
    render plain: f
  end

  def upload
    name = params[:stl_upload].original_filename
    path = File.join(Rails.root, 'app', 'meshes', name)
    @upload_path = path
    File.open(path, "wb") { |f| f.write(params[:stl_upload].read) }
    redirect_to '/fab_plan/view'
  end
end
