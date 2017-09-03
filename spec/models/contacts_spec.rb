require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a full name" do
				company = Company.new(name: "Turing")
        contact = Contact.new(position: "Manager", email: "123@easy.com" )
        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
				company = Company.new(name: "Turing")
        contact = Contact.new(full_name: "Leslie Stahl", email: "123@easy.com" )
        expect(contact).to be_invalid
      end

      it "is invalid without a emai;" do
				company = Company.new(name: "Turing")
        contact = Contact.new(position: "Manager", full_name: "Cat Henderson" )
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        company = Company.create(name: "Turing")
        contact = company.contacts.create(full_name: "Developer", position: "Manager", email: "123@easy.com")
        expect(contact).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      contact = Contact.new(full_name: "Software", position: "Manager", email: "123@easy.com")
      expect(contact).to respond_to(:company)
    end
  end
end
