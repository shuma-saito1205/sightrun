class CreateRoots < ActiveRecord::Migration[6.1]
  def change
    create_table :roots do |t|
      t.integer :user_id
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
