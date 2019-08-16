class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :cost, presence: true
  validates :origin, presence: true
  before_save(:titleize_product)


scope :three_most_recent, -> { order(created_at: :desc).limit(3)}

scope :most_reviews, -> {(
  select("products.id, products.name, products.cost, products.origin, count(reviews.id) as reviews_count")
  .joins(:reviews)
  .group("products.id")
  .order("reviews_count DESC")
  .limit(1)
  )}


# All products made in the USA for buyers that want to buy local products
  #The three most recently added products.

  private
    def titleize_product
      self.name = self.name.titleize
    end
end
