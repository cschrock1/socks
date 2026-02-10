class AddUserToSocks < ActiveRecord::Migration[8.1]
  def change
    add_reference :socks, :user, null: false, foreign_key: true
  end
end
