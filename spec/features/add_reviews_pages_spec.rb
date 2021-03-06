require 'rails_helper'

describe "the add a product process" do
  it "adds a product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'Flan'
    fill_in 'Cost', :with => 10
    fill_in 'Origin', :with => 'Mexico'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Flan'
    within('#all')do
    click_on 'Flan'
  end
    click_on 'Add a review'
    fill_in 'Author', :with => 'Dan'
    fill_in 'Content body', :with => 'fjkdjfdksjffkljdfkjfkjfkdsjfdkfjdkfjdskfjdkfjdkfjdksfjdslakfjsdklfjdskfjkafjkdsjfkljafkdsjfkdsjfkdsjfkdsfjkdfjdfklfjdsklfjdskalfjdskjfkdslfjdskl'
    fill_in 'Rating', :with => 5
    click_on 'Create Review'
    expect(page).to have_content 'Review successfully added!'
    expect(page).to have_content 'Dan'
  end

  it "gives an error when no name is entered" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'Flan'
    fill_in 'Cost', :with => 10
    fill_in 'Origin', :with => 'Mexico'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Flan'
    within('#all')do
    click_on 'Flan'
  end
    click_on 'Add a review'
    click_on 'Create Review'
    expect(page).to have_content "Author can't be blank"
  end
end
