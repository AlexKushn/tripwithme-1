class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :cars, :sits, :sit
    rename_column :cars, :name, :car_name
    rename_column :trips, :passengers, :passenger
  end
end
