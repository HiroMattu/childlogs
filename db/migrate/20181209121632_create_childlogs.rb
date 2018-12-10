class CreateChildlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :childlogs do |t|
      t.string :word
      t.string :content

      t.timestamps
    end
  end
end
