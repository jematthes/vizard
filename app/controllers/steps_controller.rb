class StepsController  < ApplicationController
	before_action :authenticate_user!
  respond_to :html

  def step1
    @real_problem = RealProblem.find_or_initialize_by(id: params[:rp_id])
  end

  def step2
    @objective = Objective.find_or_initialize_by(id: params[:objective_id])
    @objectives = Objective.all
  end

  def step3
  end

  def step4
  end
  
  def project_index
  end
  def stage1
  end
end
