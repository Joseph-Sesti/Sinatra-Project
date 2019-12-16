class AddUserIdToVideogameSystems < ActiveRecord::Migration[6.0]
  def change
    add_column :videogame_systems, :user_id, :integer
  end
end
