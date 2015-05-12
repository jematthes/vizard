class SolutionsController < ApplicationController
  before_action :set_solution, only: [:show, :edit, :update, :destroy]
  before_action :set_policy_problem, except: [:aside, :aside_form, :list]
  before_action :set_real_problem, except: [:aside, :aside_form, :list]

  respond_to :html, :json

  def index
    @solutions = Solution.where(policy_problem_id: @policy_problem)
    respond_with(@real_problem, @policy_problem, @solutions)
  end

  def show
    respond_with(@real_problem, @policy_problem, @solution)
  end

  def new
    @solution = Solution.new
    respond_with(@real_problem, @policy_problem, @solution)
  end

  def edit
  end

  def aside
    render :aside, layout: false
  end

  def aside_form
    render :aside_form, layout: false
  end

  def list
    render :list, layout: false
  end

  def create
    @solution = @policy_problem.solutions.create(solution_params)
    @solution.save
    respond_with(@real_problem, @policy_problem, @solution)
  end

  def create_ww
    @solution = @policy_problem.solutions.create(solution_params)
    @solution.save
    respond_with(@real_problem, @policy_problem, @solution)
  end

  def update
    @solution.update(solution_params)
    respond_with(@real_problem, @policy_problem, @solution)
  end

  def destroy
    @solution.destroy
    respond_with(@real_problem, @policy_problem)
  end

  private
    def set_solution
      @solution = Solution.find(params[:id])
    end

    def set_policy_problem
      @policy_problem = PolicyProblem.find(params[:policy_problem_id])
    end

    def set_real_problem
      @real_problem = RealProblem.find(params[:real_problem_id])
    end

    def solution_params
      params.require(:solution).permit(:title, :description, :policy_problem_id)
    end
end
