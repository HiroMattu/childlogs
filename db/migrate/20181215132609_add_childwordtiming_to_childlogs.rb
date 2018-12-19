class AddChildwordtimingToChildlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :childlogs, :childwordtiming, :date
  end
end
