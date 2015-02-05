class FavoritesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_project

  def create
    @favorite = @project.favorites.new
    @favorite.user = current_user
    if @favorite.save
      redirect_to @project, notice: "Thank you for favoriting"
    else
      redirect_to @project, alert: "You project could not be saved"
    end
  end

  def destroy
    @favorite = @project.favorites.find params[:id]
    if @favorite.destroy
      redirect_to @project, notice: "Unfavorited!"
    else 
      redirect_to @project, alert: "Can't Unfavorite"
    end 
  end 

  private

  def find_project
    @project = Project.find params[:project_id]
  end 


end
