class CreateChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :children do |t|
      t.string :childname
      t.date :childbirthday
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
