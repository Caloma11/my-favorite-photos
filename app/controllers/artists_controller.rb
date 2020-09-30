class ArtistsController < ApplicationController

  before_action :set_artist, only: [:show, :create]


  def show; end

  def new
    @artist = Artist.new
  end

  def create
    @artist.user = current_user
    if @artist.save
      redirect_to artist_show_path
    else
      render :new
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:bio, :specialty)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

end
