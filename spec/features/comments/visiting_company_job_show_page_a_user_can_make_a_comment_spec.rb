require 'rails_helper'

describe "When visiting a company's job show page" do
	it "a user can make a comment on that job" do
		category = Category.create(title: "Sales")
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    job2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id: category.id )

		visit company_job_path(company, job1)
		click_on "Add Comment"
		fill_in "Content", with: "Damn, that is a sweet job you might say!"
		click_on "Create Comment"

		expect(page).to have_content("Damn, that is a sweet job you might say!")
	end

end
