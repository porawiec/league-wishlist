class CreateSkins < ActiveRecord::Migration[6.0]
  def change
    create_table :skins do |t|
      t.integer :champ_id
      t.string :name
      t.integer :cost

      t.timestamps
    end
  end
end
