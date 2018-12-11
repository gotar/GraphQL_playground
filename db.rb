# Dataset representation

# purely a visual representation of the data
# as it would sit in the database
USERS = [
  {id: 1, username: 'briang'},
  {id: 2, username: 'mary_matrix'}
]

PROJECTS = [
  {id: 1, user_id: 1, name: 'Kinda Lame Project'},
  {id: 2, user_id: 2, name: 'Super Important Project'},
  {id: 3, user_id: 1, name: 'Secret Mega Project'}
]

PROJECT_TASKS = [
  {id: 1, project_id: 1, description: 'Project 1, Task 1'},
  {id: 2, project_id: 1, description: 'Project 1, Task 2'},
  {id: 3, project_id: 2, description: 'Project 2, Task 1'},
  {id: 4, project_id: 2, description: 'Project 2, Task 2'},
  {id: 5, project_id: 3, description: 'Project 3, Task 1'},
]

class Repo
  attr_accessor :dataset

  def initialize(dataset)
    @dataset = dataset
  end

  def all
    dataset
  end

  def [](id)
    dataset.find{|x| x[:id] == id}
  end
end

class UsersRepo < Repo; end
class ProjectsRepo < Repo; end
class ProjectTasksRepo < Repo; end
