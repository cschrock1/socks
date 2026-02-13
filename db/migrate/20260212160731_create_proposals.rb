class CreateProposals < ActiveRecord::Migration[8.1]
  def change
    create_table :proposals do |t|
      t.references :sock_1, null: false, foreign_key: { to_table: :socks }
      t.references :sock_2, null: false, foreign_key: { to_table: :socks }
      t.timestamps
    end
  end
end
