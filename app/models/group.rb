class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :group_accounts
  has_many :accounts, through: :group_accounts

  validates :name, presence: true
  validates :icon, presence: true
end
