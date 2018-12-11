module Types
  class ProjectType < GraphQL::Schema::Object
    graphql_name 'Project'

    field :id, ID, null: false
    field :name, String, null: false
  end
end
