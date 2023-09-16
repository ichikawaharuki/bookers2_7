class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :favorites_count
      t.integer :views_count, default: 0
      t.string :star
      t.timestamps
    end
  end
end
