class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :name
      t.belongs_to :album
      t.belongs_to :song

      t.timestamps
    end
  end
end
