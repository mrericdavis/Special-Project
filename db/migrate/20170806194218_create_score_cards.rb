class CreateScoreCards < ActiveRecord::Migration[5.1]
  def change
    create_table :score_cards do |t|
      t.integer :image_id
      t.integer :user_id
      t.integer :value

      t.timestamps
    end
  end
end
