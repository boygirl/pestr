class TodosController < ApplicationController
  before_filter :find_team
  before_filter :find_todo, only: [:show, :edit, :update, :destroy]


  def show

  end

  def new
    @todo = @team.todos.build
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def find_team
      @team = Team.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The team you were looking for could not be found."
      redirect_to teams_path
    end

    def find_todo
      @todo = @team.todos.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The todo you were looking for could not be found."
      redirect_to root_path
    end
end
