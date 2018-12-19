class AddChildRefToChildlogs < ActiveRecord::Migration[5.0]
  def change
    add_reference :childlogs, :child, foreign_key: true
  end
end
