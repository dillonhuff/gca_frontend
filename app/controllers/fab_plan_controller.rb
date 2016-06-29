class FabPlanController < ApplicationController
  def create
  end

  def view
  end

  def download
    output_path = File.join(Rails.root, 'app', 'plans', 'final_plan.json')
    f = File.read(output_path)
    render plain: f
  end

  def upload
    name = params[:stl_upload].original_filename
    path = File.join(Rails.root, 'app', 'meshes', name)
    @upload_path = path
    File.open(path, "wb") { |f| f.write(params[:stl_upload].read) }

    stl_path = @upload_path
    inputs_path = File.join(Rails.root, 'app', 'inputs', 'inputs.json')
    output_path = File.join(Rails.root, 'app', 'plans', 'final_plan.json')
    plan_path = File.join(Rails.root, 'app', 'execs', 'json-plan')

    exec_str = plan_path.to_s + " "+ stl_path.to_s + " " + inputs_path.to_s + " " + output_path.to_s

    if system exec_str
      redirect_to '/fab_plan/view'
    else
      render plain: "ERROR"
    end
  end

end
