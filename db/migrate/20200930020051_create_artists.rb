class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :bio
      t.string :specialty

      t.timestamps
    end
  end
end
