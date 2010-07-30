class UsersController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.html
    end
  end
  def show
    @user = User.find(params[:id])
    @profile = @user.profile
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
    #发送徽章
    badgeid = 1
    exist = @user.badgings.find_by_badge_id(badgeid)
    if @profile.display_name? and @profile.real_name? and @profile.age? and @profile.gender? and @profile.website? and @profile.location? and @profile.school? and @profile.about_me? and not exist
      add_badge @user, badgeid
      notification = "您获得了一枚#{Badge.first.name}徽章"
      send_notification @profile, "badge", notification
    end
  end

end
