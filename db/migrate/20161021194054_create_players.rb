class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :pro_team
      t.integer :owner_id

      t.timestamps
    end
  end
end
