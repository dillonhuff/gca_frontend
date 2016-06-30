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

  def tools()
    tools ||= []
    Tool.all.each do |t|
      tools << {:tool_diameter => t.diameter,
                :tool_length => t.length,
                :tool_num_flutes => t.numFlutes,
                :tool_material => t.material}
    end
    return tools
  end

  # TODO: Need to actually allow user workpiece inputs
  def workpiece()
    stock = {:x => [3.5, 0, 0],
             :y => [0, 3.0, 0],
             :z => [0, 0, 3.0],
             :workpiece_material => "ACETAL"}
    return stock
  end

  # TODO: Actually allow many different vices and pick one
  def vice()
    v = Vice.all[0]
    return {:vice_pos => [v.xPos, v.yPos, v.zPos],
            :vice_x_length => v.xLength,
            :vice_y_length => v.yLength,
            :vice_base_height => v.baseHeight,
            :vice_top_height => v.topHeight,
            :vice_clamp_width => v.clampWidth,
            :vice_max_jaw_width => v.maxJawWidth,
            :vice_protective_base_plate_height => v.protectiveBasePlateHeight}
  end

  def base_plates()
    plates ||= []
    BasePlate.all.each do |p|
      plates << p.height
    end
    return plates
  end

  def parallel_plates()
    plates ||= []
    ParallelPlate.all.each do |p|
      plates << p.height
    end
    return plates
  end

  def fixtures()
    fixes = {:vice => vice(),
             :base_plates => base_plates(),
             :parallel_plates => parallel_plates()}
    return fixes
  end

  def create_inputs(output_file_name)
    inputs_json = {:tools => tools(),
                   :fixtures => fixtures(),
                   :workpiece => workpiece()}.to_json
    out_path = File.join(Rails.root, 'app', 'inputs', output_file_name)
    File.open(out_path, "wb") { |f| f.write(inputs_json) }
  end

  def upload
    name = params[:stl_upload].original_filename
    path = File.join(Rails.root, 'app', 'meshes', name)

    create_inputs('inputs.json');
    
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
