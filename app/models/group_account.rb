class GroupAccount < ApplicationRecord
  belongs_to :group
  belongs_to :account
end
