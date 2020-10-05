module SchedulesHelper
  def status_schedule status
    description = Schedule.human_attribute_name(status)#I18n.t("registration_status.#{status}")
		case status
      when Schedule.statuses.keys[0] then "<span class='badge badge-warning'>#{description}</span>".html_safe
			when Schedule.statuses.keys[1] then "<span class='badge badge-success'>#{description}</span>".html_safe
			when Schedule.statuses.keys[2] then "<span class='badge badge-danger'>#{description}</span>".html_safe
		end
	end
end
