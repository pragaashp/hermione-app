class Professor < ActiveRecord::Base

  has_and_belongs_to_many :courses, join_table: :assignments
  has_many :requests, through: :courses

  def self.all_data_for id
    self.includes(courses: :request).find(id)
  end

end
