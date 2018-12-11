require_relative 'types/query_type'

class AppSchema < GraphQL::Schema
  query Types::QueryType
end
