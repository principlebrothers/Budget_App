class CreateGroupAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :group_accounts do |t|
      t.references :group, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
