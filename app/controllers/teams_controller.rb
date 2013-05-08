class TeamsController < ApplicationController
  before_filter :find_team, only: [:show, :edit, :update, :destroy]
  def index
    @teams = Team.all
  end

  def show
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to @team, notice: "Your team has been created."
    else
      flash[:alert] = "Your team was not created."
      render action: "new"
    end
  end

  def edit
  end

  def update
    if @team.update_attributes(params[:team])
      redirect_to @team, notice: "Your team has been updated."
    else
      flash[:alert] = "Your team was not updated."
      render action: "edit"
    end
  end

  def destroy
    @team.destroy
    flash[:notice] = "Your team has been deleted."
    redirect_to '/'
  end

  private
    def find_team
      @team = Team.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The team you were looking for could not be found."
      redirect_to teams_path
    end
end
