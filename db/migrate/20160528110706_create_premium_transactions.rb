class CreatePremiumTransactions < ActiveRecord::Migration
  def change
    create_table :premium_transactions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :price
      t.integer :total

      t.timestamps null: false
    end
  end
end
