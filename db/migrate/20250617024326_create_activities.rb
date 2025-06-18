class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.float :mileage
      t.string :hour
      
      t.timestamps
    end
  end
end
