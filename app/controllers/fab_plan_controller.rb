class FabPlanController < ApplicationController
  def create
  end

  def view
  end

  def download
    fname = File.join(Rails.root, 'app', 'plans', 'final_plan.json')
    f = File.read(fname)
    render plain: f
  end
end
