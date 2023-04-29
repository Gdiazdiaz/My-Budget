class Group < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :movements, foreign_key: 'category_id'

    validates :name, presence: true
    validates :icon, presence: true
end
