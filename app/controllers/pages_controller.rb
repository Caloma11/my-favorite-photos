class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @photos = Artist.all.map { |artist| artist.photos }.flatten
  end

  def dashboard
    @favorites = current_user.favorites
  end

end
