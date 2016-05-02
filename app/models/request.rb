class Request < ActiveRecord::Base

  belongs_to :course

  # Note: status => {-1: Declined, 0: Pending, 1: Approved} #

  def self.filter(query, sort)
    if query.nil?
      self.includes(:course).all.order(sort)
    else
      s_time = Course.denormalize_time(query[:start_time])
      e_time = Course.denormalize_time(query[:end_time])
      if s_time == e_time
        s_time, e_time = '0000', '2400'
      end
      location = query[:location].eql?('ALL LOCATIONS') ? '' : query[:location]
      self.includes(:course).where('courses.location LIKE ? AND courses.start_time >= ? AND courses.end_time <= ?', "%#{location}%", "#{s_time}", "#{e_time}").references(:course).order(sort)
    end
  end

end
