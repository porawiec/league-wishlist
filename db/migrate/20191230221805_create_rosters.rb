class CreateRosters < ActiveRecord::Migration[6.0]
  def change
    create_table :rosters do |t|
      t.integer :player_id
      t.integer :champ_id

      t.timestamps
    end
  end
end
