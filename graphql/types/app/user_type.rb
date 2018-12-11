module Types
  class UserType < GraphQL::Schema::Object
    graphql_name 'User'

    field :id, ID, null: false
    field :username, String, null: false

    field :projects, [ProjectType], null: true

    def projects
      ::UsersRepo.new(USERS).projects_for_user(object[:id])
    end
  end
end
