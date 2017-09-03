require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    category = Category.create(title: "Sales")
    company = Company.create!(name: "ESPN")
		job = company.jobs.create!(title: "Mechanic", description: "working on cars",
												 level_of_interest: 3, city: "Denver", category_id: category.id)
    visit company_path(company)
		click_on "Edit"
		fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    click_on "Update Job"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("ESPN")
  end
end
