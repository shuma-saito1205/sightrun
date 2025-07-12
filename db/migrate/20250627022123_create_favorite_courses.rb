class CreateFavoriteCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_courses do |t|
      t.integer :user_id
      t.text :introduction

      t.timestamps
    end
  end
end
