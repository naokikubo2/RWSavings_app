class ChangeDataHourlyPayToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :hourly_pay, 'integer USING CAST(hourly_pay AS integer)'
  end
end
