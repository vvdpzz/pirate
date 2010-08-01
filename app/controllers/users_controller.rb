class UsersController < ApplicationController
  def index
    @users = User.paginate :page => params[:page]
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @profile.about_me = RedCloth.new(@profile.about_me).to_html
    respond_to do |format|
      format.html
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @profile = @user.profile
  end
  
  def update
    @user = User.find(params[:id])
    @profile = @user.profile
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @user }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
end
