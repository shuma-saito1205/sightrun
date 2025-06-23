class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :admin_id
      t.string :title
      t.text :detail
      t.string :location
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
