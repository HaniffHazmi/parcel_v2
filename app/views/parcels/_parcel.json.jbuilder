json.extract! parcel, :id, :tracking_number, :courier, :status, :resident_id, :received_at, :delivered_at, :created_at, :updated_at
json.url parcel_url(parcel, format: :json)
