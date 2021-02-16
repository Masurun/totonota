class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :spa_name,             null: false
      t.text :features,               null: false
      t.integer :congestion_rate_id,  null: false
      t.integer :visit_time_id,       null: false
      t.text :review
      t.text :strange_person
      t.references :user,             foreign_key: true
      t.timestamps
    end
  end
end
