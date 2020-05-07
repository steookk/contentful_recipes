require 'kramdown'

module Recipes
  class RecipePresenter
    attr_reader :recipe

    delegate_missing_to :recipe

    def initialize(recipe)
      @recipe = recipe
    end

    def tags_names
      recipe.tags_names&.join(" ")
    end

    def description
      Kramdown::Document.new(recipe.description).to_html
    end

    def chef_name
      "By: " + (recipe.chef_name || "Marley Spoon best recipes")
    end
  end
end