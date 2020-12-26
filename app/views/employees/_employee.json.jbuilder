json.extract! employee, :id, :shop_id, :first_name, :last_name, :contact, :address, :email, :employee_type, :created_at, :updated_at
json.url employee_url(employee, format: :json)
