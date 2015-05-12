class ActorsController < ApplicationController
  before_action :set_actor, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @actors = Actor.all
    respond_with(@actors)
  end

  def show
    respond_with(@actor)
  end

  def new
    @actor = Actor.new
    respond_with(@actor)
  end

  def edit
  end

  def create
    @actor = Actor.new(actor_params)
    @actor.save
    respond_with(@actor)
  end

  def update
    @actor.update(actor_params)
    respond_with(@actor)
  end

  def destroy
    @actor.destroy
    respond_with(@actor)
  end

  private
    def set_actor
      @actor = Actor.find(params[:id])
    end

    def actor_params
      params.require(:actor).permit(:name, :description, :actor_type, :support, :influence)
    end
end
