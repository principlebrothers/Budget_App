require 'rails_helper'

RSpec.describe Group, type: :model do
  subject { Group.create(name: 'Gifts', author_id: 1) }

  it 'should validate presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should belong to author' do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end

  it 'should have many transactions' do
    assc = described_class.reflect_on_association(:accounts)
    expect(assc.macro).to eq :has_many
  end
end
