class Movement < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category, class_name: 'Group'

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
