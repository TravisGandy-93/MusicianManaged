class AddNameToAlbums < ActiveRecord::Migration[6.0]
  def change
    change_table :albums do |a|
      a.rename :genre, :name
    end 
  end
end
