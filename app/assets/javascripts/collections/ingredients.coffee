#= require ../models/ingredient
class Cookbook.Ingredients extends Backbone.Collection
  constructor: (model, options) -> 
    super
    @recipe = options.recipe
  
  url: -> "/recipes/#{@recipe.id}/ingredients"
  
  model: Cookbook.Ingredient