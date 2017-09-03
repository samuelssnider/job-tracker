require 'rails_helper'
describe "A user" do
	it "can visit the categories index" do
		category = Category.create(title: "Sales")
		visit "/categories"

		expect(page).to have_content("All Categories:")
		expect(page).to have_content("Sales")
	end
end
