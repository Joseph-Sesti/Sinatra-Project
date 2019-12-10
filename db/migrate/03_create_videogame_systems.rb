class CreateVideogameSystems < ActiveRecord::Migration
  def change
    create_table :videogame_systems do |t|
      t.string :title
      t.string :release_date
      t.string :manufacturer
    end
  end
end
