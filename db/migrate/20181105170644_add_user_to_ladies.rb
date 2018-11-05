class AddUserToLadies < ActiveRecord::Migration[5.2]
  def change
    add_reference :ladies, :user, foreign_key: true
  end
end
