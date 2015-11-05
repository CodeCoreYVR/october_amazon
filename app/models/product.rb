class Product < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true,
                    numericality: {greater_than: 0}
end
