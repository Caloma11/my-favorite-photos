class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites


  def has_favorite?(blob)
    favorites.map(&:blob).include?(blob)
  end

  def favorite_of(blob)
    favorites.find_by(active_storage_blob: blob)
  end

end

