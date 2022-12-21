class Account < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :group_accounts
  has_many :groups, through: :group_accounts

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 1_000_000_000_000, message: "must be a valid amount"}
end
