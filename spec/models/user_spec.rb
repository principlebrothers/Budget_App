require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'John Kuma') }

  it 'should validate presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have many accounts' do
    assc = described_class.reflect_on_association(:accounts)
    expect(assc.macro).to eq :has_many
  end

  it 'should have many groups' do
    assc = described_class.reflect_on_association(:groups)
    expect(assc.macro).to eq :has_many
  end
end
