class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :department

  enum status: [:opened, :requested, :confirmed, :inactivated]

  validates :day_hour, presence: true

  scope :day_hour, lambda { |query|
    where("schedules.day_hour >= ? AND schedules.day_hour <= ?", "#{query} 00:00", "#{query} 23:59")
  }
  scope :department_query, lambda { |query|
    joins(:department).where("departments.name ILIKE ?", "#{query}")
  }
	scope :sorted_by, lambda { |sort_option|
	  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
	  case sort_option.to_s
    when /^day_hour/
      order("day_hour #{ direction }")
    when /^departments/
      order("departments.name #{ direction }")
	  else
	    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
#where public.demands.date >= '2018-01-09' AND demands.date <= '2018-01-09'

	filterrific(

	  available_filters: [
	  	:sorted_by,
      :day_hour,
      :department_query
	  ]
	)

  def self.options_for_sorted_by
    [
      ['Data (Crescente)', 'day_hour_asc'],
      ['Data (Decrescente)', 'day_hour_desc'],
      ['Departamentos (Crescente)', 'name_asc'],
    ]
  end

end
