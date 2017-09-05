class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.top_loi
    var = Job.group(:company_id).average(:level_of_interest).sort_by { |company, average_loi| average_loi}
    var[-3..-1].map{ |company| [Company.find(company[0]), company[1]]}
  end

  def self.loi_list
    Job.group(:level_of_interest).order("count_id DESC").count(:id).sort_by { |loi, count| loi}
  end

  def self.job_count_by_city
    Job.group(:city).order("count_id DESC").count(:id).sort_by { |city, count| count}
  end
end
