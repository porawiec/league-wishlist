class CreateWishes < ActiveRecord::Migration[6.0]
  def change
    create_table :wishes do |t|
      t.integer :player_id
      t.integer :champ_id
      t.integer :rank

      t.timestamps
    end
  end
end
