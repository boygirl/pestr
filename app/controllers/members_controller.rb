class MembersController < ApplicationController
  before_filter :find_team
  before_filter :find_member, only: [:show, :edit, :update, :destroy]


  def index

  end

  def show

  end

  def new
    @member = @team.members.build
  end

  def create
    @member = @team.members.build(params[:member])
    if @member.save
      flash[:notice] = "A new member has been added to your team!"
      redirect_to @team
    else
      flash[:alert] = "No one was added to your team."
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @member.update_attributes(params[:member])
      flash[:notice] = "Membership has been updated."
      redirect_to @team
    else
      flash[:alert] = "Membership has not been updated."
      render :action => :edit
    end
  end

  def destroy
    @member.destroy
    flash[:notice] = "A member has been deleted."
    redirect_to @team
  end

  private
    def find_team
      @team = Team.find(params[:team_id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The team you were looking for could not be found."
      redirect_to teams_path
    end

    def find_member
      @member = @team.members.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The member you were looking for could not be found."
      redirect_to root_path
    end
end


