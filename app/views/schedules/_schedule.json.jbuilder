json.extract! schedule, :id, :day, :hour_begin, :hour_end, :status, :user_id, :setor_id, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
