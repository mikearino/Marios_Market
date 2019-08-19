require 'rails_helper'

describe "the add a product process" do
  it "adds a product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'Apple'
    fill_in 'Cost', :with => 10
    fill_in 'Origin', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Apple'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end
