class Product < ApplicationRecord


 scope :three_most_recent, -> { order(created_at: :desc).limit(3)}


  #The three most recently added products.
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :cost, presence: true
  validates :origin, presence: true
  before_save(:titleize_product)

  private
    def titleize_product
      self.name = self.name.titleize
    end
end
