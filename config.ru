require 'roda'
require 'graphql'

require_relative 'graphql/app_schema'

class App < Roda
  plugin :json
  plugin :json_parser, parser: proc{|input| JSON.parse(input, symbolize_names: true)}
  plugin :indifferent_params

  route do |r|
    r.is "graphql" do
      r.post do
        AppSchema.execute(
          params[:query]
        ).to_h
      end
    end
  end
end

run App.freeze.app
