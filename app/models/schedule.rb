class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :department
  has_many :solicitations

  enum status: [:opened, :crowded, :canceled]

  validates :day_hour, :spaces, presence: true
  validates :spaces, :numericality => { :greater_than_or_equal_to => 0 }

  scope :day_hour_query, lambda { |query|
    where("schedules.day_hour >= ? AND schedules.day_hour <= ?", "#{query} 00:00", "#{query} 23:59")
  }
  scope :department_query, lambda { |query|
    joins(:department).where("departments.name ILIKE ?", "#{query}")
  }

  scope :status_query, lambda { |query|
    where(status: query)
  }

  scope :user_query, lambda { |query|
    where(user: query)
  }

  scope :requester_query, lambda { |query|
    where(requester: query)
  }

	scope :sorted_by, lambda { |sort_option|
	  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
	  case sort_option.to_s
    when /^day_hour/
      order("day_hour #{ direction }")
    when /^departments_name/
      order("departments.name #{ direction }").includes(:department).references(:department)
	  else
	    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

	filterrific(

	  available_filters: [
	  	:sorted_by,
      :day_hour_query,
      :department_query,
      :status_query,
      :user_query,
      :requester_query
	  ]
	)

  def self.options_for_sorted_by
    [
      ['Data (Crescente)', 'day_hour_asc'],
      ['Data (Decrescente)', 'day_hour_desc'],
      ['Departamentos (Crescente)', 'departments_name_asc'],
    ]
  end

end
