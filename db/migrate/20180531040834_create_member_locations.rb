class CreateMemberLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :member_locations do |t|
      t.string     :name, null: false
      t.references :team_map
      t.string     :location, null: false, default: ""

      t.timestamps
    end
  end
end
