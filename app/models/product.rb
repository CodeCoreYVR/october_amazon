class Product < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true,
                    numericality: {greater_than: 0}
end
