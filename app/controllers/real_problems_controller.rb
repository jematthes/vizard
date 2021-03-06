class RealProblemsController < ApplicationController
  before_action :set_real_problem, only: [:show, :edit, :update, :update_ww, :destroy]
  before_action :set_project, only: [:create]

  respond_to :html, :json

  def index
    @real_problems = RealProblem.all
    respond_with(@real_problems)
  end

  def show
    respond_with(@real_problem)
  end

  def new
    @real_problem = RealProblem.new
    respond_with(@real_problem)
  end

  def edit
  end

  def create
    @real_problem = @project.create_real_problem(real_problem_params)
    respond_with(@real_problem)
  end

  def update
    @real_problem.update(real_problem_params)
    respond_with(@real_problem)
  end

  def destroy
    @real_problem.destroy
    respond_with(@real_problem)
  end

  def focus_area
    @rp = RealProblem.new
    
    respond_with(@rp.focus_area_list)
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_real_problem
      @real_problem = RealProblem.find(params[:id])
    end

    def real_problem_params
      params.require(:real_problem).permit(:title, :description, :project_id, :focus_area, :goal)
    end
end
