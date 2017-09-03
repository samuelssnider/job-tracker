require 'rails_helper'
describe "A user" do
	it "can visit the categories index and create a category" do
		category = Category.create(title: "Sales")

		visit "/categories"
		click_on "Edit"
		fill_in "category[title]", with: "Ramen"
		click_on "Update Category"

		expect(page).to have_content("Ramen")
		expect(current_path).to eq("/categories/#{category.id}")

	end
end
