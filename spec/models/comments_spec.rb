require 'rails_helper'

describe Comment do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        comment = Comment.new()
        expect(comment).to be_invalid
      end

      it "has unique content" do
				category = Category.create(title: "Sales")
				company = Company.create(name: "Turing")
				job = Job.create(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category_id: category.id)
				job.comments.create(content: "Yes")
				comment = Comment.create(content: "Yes")
        expect(comment).to be_invalid
      end
    end

		context "valid attributes" do
			it "is valid with a title" do
				category = Category.create(title: "Sales")
				company = Company.create(name: "Turing")
				job = Job.create(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category_id: category.id)
				comment = job.comments.create(content: "Yes")
				expect(comment).to be_valid
			end
	end
end

		describe "relationships" do
		it "belongs_to" do
			category = Category.create(title: "Sales")
			company  = Company.create(name: "Turing")
			job      = Job.create(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category_id: category.id)
			comment  = job.comments.create(content: "Yes")
			expect(comment).to respond_to(:job)
		end
	end
end
