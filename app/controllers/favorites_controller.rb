class FavoritesController < ApplicationController

  def create
    blob = ActiveStorage::Blob.find(params[:blob])
    favorite = Favorite.new(user: current_user, active_storage_blob: blob)
    favorite.save!
    redirect_to request.referrer
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_to request.referrer
  end

end
