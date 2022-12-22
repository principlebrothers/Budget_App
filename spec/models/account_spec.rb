require 'rails_helper'

RSpec.describe Account, type: :model do
  subject { Account.create(name: 'Savings', author_id: 1) }

  it 'should validate presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should belong to author' do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end

  it 'should have many groups' do
    assc = described_class.reflect_on_association(:groups)
    expect(assc.macro).to eq :has_and_belongs_to_many
  end
end
