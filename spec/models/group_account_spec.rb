require 'rails_helper'

RSpec.describe GroupAccount, type: :model do
  subject do
    User.create(name: 'John', email: 'john@gmail.com', password: 'testQ12', confirmed_at: Time.now)
    first_group = Group.create(name: 'Gifts', author_id: 1)
    first_account = Account.create(name: 'Savings', author_id: 1, amount: 100)
    GroupAccount.create(id: 1, group_id: first_group.id, account_id: first_account.id, created_at: Time.now,
                        updated_at: Time.now)
  end

  it 'should belong to group' do
    assc = described_class.reflect_on_association(:group)
    expect(assc.macro).to eq :belongs_to
  end

  it 'should belong to account' do
    assc = described_class.reflect_on_association(:account)
    expect(assc.macro).to eq :belongs_to
  end

  it 'should have group_id and account_id' do
    subject.group_id = 1
    subject.account_id = 1
    expect(subject.group_id).to eq 1
    expect(subject.account_id).to eq 1
  end
end
