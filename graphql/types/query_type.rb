%w(base ext app).each do |dir|
  Dir[File.join(__dir__, dir, '*.rb')].each(&method(:require))
end

require_relative './../../db'

module Types
  class QueryType < Types::BaseObject


    # Simple query to test
    # query {
    #   users {
    #     id
    #     username
    #     projects {
    #       id
    #       name
    #     }
    #   }
    # }

    field :users, [UserType], null: false do
      description "Returns a list of all Users"
    end

    field :user, UserType, null: false do
      description "Return a User"
      argument :id, ID, required: true
    end

    def users
      UsersRepo.new(USERS).all
    end

    def user(id:)
      UsersRepo.new(USERS)[id]
    end
  end
end
