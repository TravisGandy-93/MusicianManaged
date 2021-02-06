class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.varbinary :artwork
      t.string :genre
      t.date :release_date
      t.belongs_to :musician, null: false, foreign_key: true

      t.timestamps
    end
  end
end
