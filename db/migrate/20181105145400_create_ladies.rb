class CreateLadies < ActiveRecord::Migration[5.2]
  def change
    create_table :ladies do |t|
      t.string :name
      t.integer :face
      t.integer :chest
      t.integer :abs
      t.integer :butt
      t.integer :legs

      t.timestamps
    end
  end
end
