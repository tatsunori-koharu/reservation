class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.bigint :user_id, foreign_key: true
      t.bigint :spase_id,   foreign_key: true

      t.timestamps
    end
  end
end
