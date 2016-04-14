class Course < ActiveRecord::Base

  has_and_belongs_to_many :professors, join_table: :assignments
  has_one :request

  def self.search(location,time)
    Course.where(:location => location,:time =>time) 
  end
  
end
