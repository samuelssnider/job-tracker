require 'rails_helper'

describe "When visiting a job page" do
  scenario "a user can link to a form to create a contact for that form" do
    company = Company.create!(name: "ESPN")

    visit company_path(company)

		click_on "Create new contact for #{company.name}"
		fill_in "contact[full_name]", with: "Penelope Santorini"
		fill_in "contact[position]", with: "Hiring Manager"
		fill_in "contact[email]", with: "penelope@wooo.com"
		click_on "Create Contact"

		expect(page).to have_content("Penelope Santorini")
		expect(page).to have_content("Hiring Manager")
		expect(page).to have_content("penelope@wooo.com")
	end
end
