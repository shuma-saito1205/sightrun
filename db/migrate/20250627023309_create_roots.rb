class CreateRoots < ActiveRecord::Migration[6.1]
  def change
    create_table :roots do |t|
      t.integer :favorite_course_id
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
