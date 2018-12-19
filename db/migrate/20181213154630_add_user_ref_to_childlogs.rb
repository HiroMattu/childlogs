class AddUserRefToChildlogs < ActiveRecord::Migration[5.0]
  def change
    add_reference :childlogs, :user, foreign_key: true
  end
end
