class ProjectsController < ApplicationController
	before_action :set_project, only: [:show, :edit, :update, :destroy, :solutions, :stage1]

  respond_to :html, :json

  def stage1
  end

  def stage2
  end

  def solutions
    @solutions = []
    @project.real_problem.policy_problems.each do |pp|
      pp.solutions.map {|s| @solutions << s}
    end
    # respond_with(@project, @solutions)
    render template: 'solutions/index.json.jbuilder'
  end

  def index
    @public_projects = Project.where(public: true)
    @private_projects = Project.where(public: false)
    respond_with(@projects)
  end

  def show
    @objectives = @project.objectives
    @a_size = 0
    @barriers_size = 0
    @factors_size = 0
    @outcomes_size = 0
    @objectives.each do |o|
      @a_size = @a_size + o.actors.size
      @barriers_size = @barriers_size + o.barriers.size
      @factors_size = @factors_size + o.enabling_factors.size
      @outcomes_size = @outcomes_size + o.outcomes.size
    end

    if !@project.real_problem.blank?
      @real_problem = @project.real_problem
      if !@project.real_problem.try(:policy_problems).try(:blank?)
        @policy_problems = @project.real_problem.policy_problems
        if !@project.real_problem.try(:get_solutions).try(:blank?)
          @solutions = @project.real_problem.get_solutions
        end
      end
    end
    
    # @policy_problems = @project.real_problem.policy_problems || PolicyProblem.none
    # @solutions = @project.real_problem.policy_problems.first.solutions || Solution.none
    respond_with(@project)
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def edit
  end

  def create
    new_params = project_params
    new_params[:public] = false if new_params[:public].nil?
    @project = Project.create(new_params)
    respond_with(@project)
  end

  def update
    new_params = project_params
    new_params[:public] = false if new_params[:public].nil?
    @project.update(new_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end

  private
    def set_project
		@project = Project.find(params[:id])
    end

    def project_params
      params[:project].permit(:title, :description, :public)
    end
end
