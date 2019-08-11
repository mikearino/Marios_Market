class AddCreatedAtToProducts < ActiveRecord::Migration[5.2]
  def change
    add_timestamps(:products, null: true)
  end
end
