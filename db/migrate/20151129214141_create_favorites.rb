class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :critic_id
      t.integer :movie_id

      t.timestamps null: false
    end
  end
end
