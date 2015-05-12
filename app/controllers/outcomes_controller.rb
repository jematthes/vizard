class OutcomesController < ApplicationController
  before_action :set_outcome, only: [:show, :edit, :update, :destroy]
  before_action :set_objective

  respond_to :html, :json

  def index
    @outcomes = @objective.outcomes
    respond_with(@outcomes)
  end

  def show
    respond_with(@outcome)
  end

  def new
    @outcome = Outcome.new
    respond_with(@outcome)
  end

  def edit
  end

  def create
    @outcome = @objective.outcomes.create(outcome_params)
    respond_with(@objective, @outcome)
  end

  def update
    @outcome.update(outcome_params)
    respond_with(@objective, @outcome)
  end

  def destroy
    @outcome.destroy
    respond_with(@objective)
  end

  private
    def set_objective
      @objective = Objective.find(params[:objective_id])
    end

    def set_outcome
      @outcome = Outcome.find(params[:id])
    end

    def outcome_params
      params.require(:outcome).permit(:title, :description, :objective_id, :outcome_type_id, :actor_type_id)
    end
end
