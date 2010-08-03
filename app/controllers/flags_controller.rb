class FlagsController < ApplicationController
  def flag
      @admin = User.first
      notification = "#{params[:user_id]}举报了#{params[:who]}_#{params[:id]}"
      @admin.notifies.build(:body => notification, :attri => 'flag')
      @admin.save
      @user = User.find(params[:user])
      @user.notifies.build(:body => notification, :attri => 'flag')
      @user.save
  end
end
