json.array!(@lifters) do |lifter|
  json.extract! lifter, :id, :index, :show
  json.url lifter_url(lifter, format: :json)
end
