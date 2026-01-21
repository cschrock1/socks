class CreateSocks < ActiveRecord::Migration[8.1]
  def change
    create_table :socks do |t|
      t.string :name
      t.text :description
      t.string :gender
      t.integer :age
      t.string :height
      t.string :color

      t.timestamps
    end
  end
end
