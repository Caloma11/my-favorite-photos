class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :active_storage_blob, class_name: "ActiveStorage::Blob", foreign_key: "active_storage_blob_id"


  # Just an alias -> it's easier to do .blob instead of .active_storage_blob
  def blob
    active_storage_blob
  end

end
