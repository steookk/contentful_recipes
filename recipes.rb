# frozen_string_literal: true

require 'contentful'

require_relative 'recipes/recipe'
require_relative 'recipes/recipe_presenter'

module Recipes
  class << self
    def all
      client.entries(content_type: 'recipe')
    end

    def find(id)
      client.entry id
    end

    private

    def client
      @client ||=
        Contentful::Client.new(
          space: ENV.fetch('CONTENTFUL_SPACE_ID'),
          access_token: ENV.fetch('CONTENTFUL_ACCESS_TOKEN'),
          entry_mapping: {
            'recipe' => Recipes::Recipe
          }
        )
    end
  end
end
