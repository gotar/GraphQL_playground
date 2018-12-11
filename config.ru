require 'roda'

load 'db.rb'

class App < Roda
  plugin :json

  route do |r|
    @users_repo = UsersRepo.new(USERS)
    @projects_repo = ProjectsRepo.new(PROJECTS)
    @project_tasks_repo = ProjectTasksRepo.new(PROJECT_TASKS)

    r.is "users" do
      r.get do
        @users_repo.all
      end
    end

    r.is "users", Integer do |id|
      r.get do
        @users_repo[id]
      end
    end
  end
end

run App.freeze.app
