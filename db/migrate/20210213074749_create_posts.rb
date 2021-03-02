class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string  :spa_name,            null: false
      t.integer :visit_time_id,       null: false
      t.integer :congestion_rate_id,  null: false
      t.integer :water_temp_id,       null: false
      t.integer :sauna_temp_id,       null: false
      t.integer :pref_id,             null: false
      t.text    :review,              null: false
      t.references :user,             foreign_key: true
      t.timestamps
    end
  end
end
