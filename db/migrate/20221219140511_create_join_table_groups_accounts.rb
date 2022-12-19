class CreateJoinTableGroupsAccounts < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :accounts do |t|
      t.index %i[group_id account_id]
      t.index %i[account_id group_id]
    end
  end
end
