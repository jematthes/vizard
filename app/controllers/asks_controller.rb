class AsksController < ApplicationController
  before_action :set_ask, only: [:show, :edit, :update, :destroy]
  before_action :set_activity

  respond_to :html

  def index
    @asks = Ask.all
    respond_with(@asks)
  end

  def show
    respond_with(@ask)
  end

  def new
    @ask = Ask.new
    respond_with(@ask)
  end

  def edit
  end

  def create
    @ask = @activity.asks.create(ask_params)
    respond_with(@activity, @ask)
  end

  def update
    @ask.update(ask_params)
    respond_with(@activity, @ask)
  end

  def destroy
    @ask.destroy
    respond_with(@activity)
  end

  private
    def set_activity
      @activity = Activity.find(params[:activity_id])
    end

    def set_ask
      @ask = Ask.find(params[:id])
    end

    def ask_params
      params.require(:ask).permit(:title, :description, :activity_id)
    end
end
