class Product < ApplicationRecord


 scope :three_most_recent, -> { order(created_at: :desc).limit(3)}

scope :product_with_most_reviews, -> {where}

 #The product with the most reviews.

Worker.select("workers.name, workers.role, count(tasks.id) as tasks_count").joins(:tasks).group("workers.id").order("tasks_count DESC").limit(10)

# All products made in the USA for buyers that want to buy local products
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
