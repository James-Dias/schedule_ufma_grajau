json.extract! user, :id, :name, :cpf, :rg, :registration, :address, :phone1, :phone2, :kind, :course, :description, :created_at, :updated_at
json.url user_url(user, format: :json)
