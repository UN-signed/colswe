json.extract! project, :id, :name, :state, :summary, :git, :created_at, :updated_at
json.url project_url(project, format: :json)
