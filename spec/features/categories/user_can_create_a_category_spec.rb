require 'rails_helper'
describe "A user" do
	it "can visit the categories index and create a category" do
		visit "/categories"
		click_on "Create New Category"
		fill_in "Title", with: "Sales"
		click_on "Create Category"

		expect(page).to have_content("All Categories:")
		expect(page).to have_content("Sales")
		expect(current_path).to eq("/categories/1")

	end
end
