require 'rails_helper'

describe "User visits a company page" do
  scenario "a user can delete a job" do
    company = Company.create!(name: "ESPN")
		company.jobs.create!(title: "Mechanic", description: "working on cars",
												 level_of_interest: 3, city: "Denver")
    visit company_path(company)
		click_on "Delete"

		expect(page).not_to have_content("Mechanic")
		expect(page).not_to have_content("Denver")


	end
end
