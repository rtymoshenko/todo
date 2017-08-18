json.extract! task, :id, :name, :priority, :deadline, :status, :project_id, :created_at, :updated_at
json.url task_url(task, format: :json)
