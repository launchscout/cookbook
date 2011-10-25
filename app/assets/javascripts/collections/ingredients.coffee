#= require ../models/ingredient
class Cookbook.Ingredients extends Backbone.Collection
  constructor: (@recipe) -> super
  
  url: -> "/recipes/#{@recipe.id}/ingredients"
  
  model: Cookbook.Ingredient