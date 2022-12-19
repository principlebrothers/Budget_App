class User < ApplicationRecord
  has_many :accounts, class_name: 'Account', foreign_key: 'author_id'
  has_many :groups, class_name: 'Group', foreign_key: 'author_id'

  validates :name, presence: true
end
