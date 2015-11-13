class Product < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true,
                    numericality: {greater_than: 0}
end
