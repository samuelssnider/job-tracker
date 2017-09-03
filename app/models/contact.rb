class Contact < ApplicationRecord
	validates :position, presence: true
	validates :full_name, :email, presence: true, uniqueness: true
	belongs_to :company
end
