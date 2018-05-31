class CreateTeamMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :team_maps do |t|
      t.string :code, null: false

      t.timestamps
    end

    add_index :team_maps, :code, unique: true
  end
end
