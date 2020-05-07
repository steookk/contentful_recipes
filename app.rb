# frozen_string_literal: true

require 'sinatra'
require 'active_support/all'
require 'byebug' if development? || test?

require_relative 'recipes'

set :port, 3000 if development?

get '/' do
  redirect to('/recipes')
end

get '/recipes' do
  @recipes = Recipes.all
  haml :recipes
end

get '/recipes/:id' do
  recipe = Recipes.find(params[:id])
  @presenter = Recipes::RecipePresenter.new(recipe)

  haml :recipe
end
