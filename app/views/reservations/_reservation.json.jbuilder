json.extract! reservation, :id, :customer_name, :customer_email, :customer_phone, :persons_size, :reservation_date, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
