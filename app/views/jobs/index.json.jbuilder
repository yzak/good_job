json.array!(@jobs) do |job|
  json.extract! job, :id, :user_id, :name, :message, :complete
  json.url job_url(job, format: :json)
end
