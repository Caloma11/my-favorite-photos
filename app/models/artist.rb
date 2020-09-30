class Artist < ApplicationRecord
  has_many_attached :photos
  belongs_to :user

  def name
    user.email.match(/^.*@/)[0][0..-2]
  end

end
