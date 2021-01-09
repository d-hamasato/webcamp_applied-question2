class RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    redirect_back(fallback_location: users_path)
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_back(fallback_location: users_path)
  end
end
