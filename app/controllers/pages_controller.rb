class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @photos = Artist.all.map { |artist| artist.photos }.flatten
  end

  def top
    @blobs = Favorite.group(:active_storage_blob_id)
    .select(:active_storage_blob_id)
    .count # Gives an array of hashes, each one containing asb_id and count
    .sort_by { |_k, v| - v } # Sorts by count
    .map { |k, v|  { blob: ActiveStorage::Blob.find(k) , count: v }} # Transforms them into a nicer hash to be used on the view with the full blob instead of just the id and it's count
  end

  def dashboard
    @favorites = current_user.favorites
  end

end
