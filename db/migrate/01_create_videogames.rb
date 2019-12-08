class CreateVideogames < ActiveRecord::Migration
  def change
    create_table :videogames do |t|
      t.string :title
      t.string :system
      t.string :release_date
    end
  end
end
